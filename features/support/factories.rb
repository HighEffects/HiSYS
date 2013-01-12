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