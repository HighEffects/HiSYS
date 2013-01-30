@slideshow
Feature: Slideshow
  In order to show cool slides on the home page
  As an Marketing tool 
  I want to see some slides!
  
  Background:
    Given I have a page titled "home"
    Given the following user records
    | email        | password |
    | bob@test.com | secret   |
  
  Scenario: show slides
    Given I am logged in 
	And I have uploaded a file "cats.jpg"
	And I have uploaded a file "sunset.jpg"
    And I have the following slides
	| title   | content | upload_id | link_title |        link |
	| Slide 1 | Testing |         1 |       Yeah | /blog/yeah/ |
	| Slide 2 | Testing |         2 |       Fuck |  /lab/fuck/ |
	When I visit the "slides_path"
	Then I should see the image "cats.jpg"
	And I should see the image "sunset.jpg"