FactoryGirl.define do
  factory :article, :class => 'Article' do
    title 'features'
    content 'infosite features include AB Test'
    category_id 1
    content_markdown 'content_markdown'
    reference 'mingle card'
  end
  
  factory :invalid_article, :class => 'Article' do 
    title "nil"
  end

end