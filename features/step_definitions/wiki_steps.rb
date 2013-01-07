# Factories

Given /^I have a page titled "(.*?)"$/ do |arg1|
  FactoryGirl.create(:page, :name => arg1, :slug => arg1, :content => arg1)
end

Given /^I have pages titled "(.*?)", "(.*?)"$/ do |arg1, arg2|
  FactoryGirl.create(:page, :name => arg1)
  FactoryGirl.create(:page, :name => arg2)
end

Given /^I have the following wiki pages$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:page, hash)
  end
end

Given /^I have a page with parent "(.*?)" and titled "(.*?)"$/ do |parent, arg1|
  FactoryGirl.create(:page, :name => arg1, :slug => arg1, :content => arg1, :parent_id => parent)
end

# Paths

When /^I go to the list of pages$/ do
  visit('/lab/list')
end

When /^I go to the lab page$/ do
  visit(pages_path)
end



Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see the link "(.*?)"$/ do |link|
  page.should have_link(link)
end

Then /^I should see "(.*?)" css tag$/ do |css|
  page.has_css?(css)
end

Then /^I should not see "(.*?)" css tag$/ do |css|
  page.has_no_css?(css)
end

Given /^I have no pages$/ do
  Page.count.should == 0
end

Given /^I am in the pages list$/ do
  visit(pages_path)
end

Given /^I am logged in$/ do
  FactoryGirl.create(:user, :email => 'test@testing.com', :password => '123456')
  visit (new_user_session_path)
    fill_in "user_email", :with => 'test@testing.com'
    fill_in "user_password", :with => '123456'
    click_button "Sign in"
    page.should have_content("test@testing.com")
end

When /^I click in the link "(.*?)"$/ do |link|
  click_link link
end

When /^I click in the button "(.*?)"$/ do |button|
  click_button button
end

Then /^I should go to create page$/ do
  page.should have_content('Nova pagina')
end

Then /^I should go to items list page$/ do
  page.should have_content('Resources')
end

Then /^I should fill in "(.*?)" with "(.*?)"$/ do |field, content|
  fill_in field, :with => content
end

When /^I should select "(.*?)" in "(.*?)"$/ do |arg1, arg2|
  select(arg1, {:from => arg2})
end


# Find item buttom
When /^I click in the link "(.*?)" of the "(.*?)" item$/ do |link, item|
  within(item) do
    click_link(link)
  end
end

Then /^I should not see "(.*?)"$/ do |item|
  page.has_no_content?(item)
end


Given /^the following user records$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash)
  end
end

Given /^I am logged in as "(.*?)" with password "(.*?)"$/ do |email, password|
  unless email
    visit(new_user_session_path)
    fill_in "email", :with => email
    fill_in "Password", :with => password
    click_button "Sign in"
  end
end

When /^I visit the "(.*?)" page$/ do |arg1|
  page = "/lab/" + arg1
  visit(page.to_s)
end