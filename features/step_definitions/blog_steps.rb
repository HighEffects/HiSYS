Given /^I have the following blog posts$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:post, hash)
  end
end

When /^I go to the blog$/ do
  visit(posts_path)
end

When /^I visit the "(.*?)" post$/ do |arg1|
  visit("/blog/" + arg1)
end