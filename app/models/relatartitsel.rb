class Relatartitsel < ActiveRecord::Base
  belongs_to :correlation, class_name: "Article"
  belongs_to :correlated, class_name: "Article"
end