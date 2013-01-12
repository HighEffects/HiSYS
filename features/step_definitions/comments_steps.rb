Given /^I have the following comments$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:comment, hash)
  end
end