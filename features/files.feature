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
	When I go to the files list page
	Then I should see "cats.jpg"
	And I should see "sunset.png"
	
  Scenario: Upload Image
  	Given I go to the files page
	When I click in the link "Upload File"
	And I fill in "upload[name]" with "Test Image"
	And I fill in "upload[legend]" with "Testing image upload action"
	And I choose the file "cats.jpg" for the "upload[file]"
	And I click in the button "Create Upload"
	Then I should see the image "cats.jpg"