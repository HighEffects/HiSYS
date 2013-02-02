@files
Feature: File Upload
  In order to share files
  As an colaborator
  I want to upload files
  
  Background:
    Given the following user records
    | email        | password |
    | bob@test.com | secret   |
  
  Scenario: List Files
    Given I have a file "cats.jpg"
	And I have a file "sunset.png"
	And I am logged in
	When I go to the files list page
	Then I should see "cats.jpg"
	And I should see "sunset.png"
	
  Scenario: Upload Image
    Given I am logged in
  	And I go to the files page
	When I click in the link "add_file"
	And I fill in "upload[name]" with "Test Image"
	And I fill in "upload[legend]" with "Testing image upload action"
	And I choose the file "cats.jpg" for the "upload[file]"
	And I click in the button "Create Upload"
	Then I should see the image "cats.jpg"
	
  Scenario: Only users logged in can create files
    Given I go to the files page
	When I visit "files/new"
	Then I should see "Login"
	
  Scenario: Only users logged in can edit files
    Given I have a file "cats.jpg"
  	When I visit "/files/1/edit"
  	Then I should see "Login"