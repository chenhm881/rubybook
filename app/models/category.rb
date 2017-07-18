class Category < ActiveRecord::Base
    has_many :articles
    validates :name, :parent_id, presence: true
    validates :name, length: { minimum: 1 },
                     uniqueness: { case_sensitive: false }
    delegate :gender, :to => :articles, :prefix=> false, :allow_nil => true
    has_many :child_categories, foreign_key: "parent_id", class_name: :Category
    has_many :reverse_child_categories, through: :child_categories, source: :parent
    belongs_to :parent, class_name: :Category
    

    def self.from_child_categories(id)
        where("id=?", id).first.child_categories.find_each do |category|
           @@child_categories.push(category.id)
           from_child_categories(category.id)
        end
    end

    def find_all_child_categories
       @@child_categories = Array.new
       @@child_categories.push(self.id) 
       self.child_categories.each do |category|
          @@child_categories.push(category.id) 
          Category.from_child_categories(category.id) 
       end
    end

    

    
end
