Given /^I have the following slides$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:slide, hash)
  end
end


Then /^I should see the image "(.*?)"$/ do |imagename|
  # page.should have_xpath("//img[@src=\"/public/uploads/file/*/#{imagename}\"]")
  # page.should have_image imagename
  page.should have_selector("img[src$='#{imagename}']")
end



When /^I visit the "slides_path"$/ do
  visit(slides_path)
end