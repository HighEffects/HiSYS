@slideshow
Feature: Slideshow
  In order to show cool slides on the home page
  As an Marketing tool 
  I want to see some slides!
  
  Scenario: show slides
    Given there are slides
	When I go to the home page
	Then I should see the image
	And I should see the text