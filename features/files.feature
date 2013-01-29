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