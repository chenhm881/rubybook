require 'rails_helper'


RSpec.describe Category, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @category = create(:category)
  end

  it 'requires name' do
    category = Category.new(name: nil)
    category.valid?
    #expect(category.errors[:name].size).to eq 2
    expect(category).to validate_presence_of(:name) 

  end
  
  it 'name should not be empty string' do
    category = Category.new(name: '')
    category.valid?
    #expect(category.errors[:name].size).to eq 2
    expect(category).to_not allow_value('').for(:name)
  end

  it 'name should not duplicate' do
    category = Category.new(name: 'Internet')
    category.valid?
    expect(category.errors[:name].size).to eq 1
  end
  
  it 'requires parentId' do
    category = Category.new(parentId: nil)
    category.valid?
    expect(category.errors[:parentId].size).to eq 1
  end
  
  it 'has many relation with articles' do
    expect(@category).to have_many(:articles)
  end

end
