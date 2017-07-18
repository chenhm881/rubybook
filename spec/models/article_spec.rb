require 'rails_helper'

describe Article, :type => :model do

  before do
    @article = Article.create(title: 'specail hotel', content: 'GDS:14583')
  end

  subject {@article}

  it 'category_id have default value 0' do
    article = Article.new(title: 'specail hotel', content: 'GDS:14583')
    article.valid?
    expect(article.category_id).to eq 0
    expect(article).to_not validate_presence_of(:category_id)
  end

  it 'belong to Category' do
    category = Category.create(name: 'specail hotel', parent_id: 0)
    expect(@article).to belong_to(:category)

  end


  context 'Article attribute valid' do
    it { should belong_to(:category) }
    it { should_not validate_presence_of(:category_id)}
    it { should validate_presence_of(:title)}
    it { should have_many(:tags)}
    it { should_not allow_value('').for(:title)}
    it { should allow_value(2).for(:title)}

    it 'Check the data type' do

    end
  end

end
