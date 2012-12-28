require 'factory_girl_rails'

FactoryGirl.define do factory :item do |f|
  f.name 'twitter-bootstrap-rails' end
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
