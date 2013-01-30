Given /^I have a file "(.*?)"$/ do |arg1|
   FactoryGirl.create(:upload, :name => arg1, :file_type => "image", :file => arg1, :legend => "", :user_id => "1")
end

Given /^I have the following files$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:upload, hash)
  end
end

When /^I go to the files list page$/ do
  visit(uploads_list_path)
end

When /^I go to the files page$/ do
  visit(uploads_path)
end

When /^I choose the file "(.*?)" for the "(.*?)"$/ do |arg1, arg2|
  attach_file(arg2, "public/testing/" + arg1)
end

Given /^I have uploaded a file "(.*?)"$/ do |arg1|
  visit(new_upload_path)
  name = arg1.split(".").first
  fill_in 'upload[name]', :with => name
  attach_file('upload[file]', "public/testing/" + arg1)
  click_button('Create Upload')
end

When /^I visit "(.*?)"$/ do |arg1|
  visit(arg1)
end
