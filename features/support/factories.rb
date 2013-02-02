require 'factory_girl_rails'

FactoryGirl.define do 
  factory :item do |f|
    f.name 'twitter-bootstrap-rails' 
  end
end

FactoryGirl.define do 
  factory :user do |f|
    f.email 'test@testing.com'
    f.password '123456'
    f.first_name "John"
    f.last_name "Doe"
  end
end

FactoryGirl.define do 
  factory :page do |f|
    f.content 'test'
  end
end

FactoryGirl.define do 
  factory :post do |f|
    f.title 'Test'
    f.content 'Testing 1 2 3'
    f.user_id '1'
  end
end

FactoryGirl.define do 
  factory :comment do |f|
    f.content 'Testing comment system'
    f.user_id '1'
    f.commentable_id '1'
    f.commentable_type 'post'
  end
end

FactoryGirl.define do 
  factory :tag do |f|
    f.name 'test'
  end
end

FactoryGirl.define do 
  factory :tagging do |f|
    f.tag_id '1'
    f.taggable_id '1'
    f.taggable_type 'Page'
  end
end

FactoryGirl.define do 
  factory :upload do |f|
    f.name 'test'
    f.file_type 'image'
    f.file 'test.jpg'
    f.legend 'Testing image'
    f.user_id '1'
    f.visibility 'public'
  end
end

FactoryGirl.define do 
  factory :slide do |f|
    f.title 'test'
    f.content 'yeah'
    f.upload_id '1'
    f.link_title 'more examples'
    f.link 'http://example.com'
  end
end