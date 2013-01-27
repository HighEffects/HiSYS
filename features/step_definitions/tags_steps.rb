Given /^I have a tag named "(.*?)"$/ do |arg1|
  FactoryGirl.create(:tag, :name => arg1)
end

Given /^I have the following taggings$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:tagging, hash)
  end
end

When /^I go to the tags_index_path$/ do
  visit(tags_index_path)
end