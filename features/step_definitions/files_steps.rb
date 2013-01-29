Given /^I have a file "(.*?)"$/ do |arg1|
  FactoryGirl.create(:upload, :name => arg1, :file_type => "image", :file => arg1, :legend => "", :user_id => "1")
end

When /^I go to the files list page$/ do
  visit(uploads_list_path)
end
