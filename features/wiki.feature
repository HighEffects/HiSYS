@wiki
Feature: wiki pages
  In order to manage pages
  As an contributor
  I want to create and manage pages

  Background:
    Given I have a page titled "home"
    Given the following user records
    | email        | password |
    | bob@test.com | secret   |

  Scenario: home page
	When I go to the lab page
	Then I should see "home"
  
  Scenario: list pages
    Given I have pages titled "test page", "page 2"
	When I go to the list of pages
	Then I should see "test page"
	And I should see "page 2"
	And I should see "home"
  
  Scenario Outline: Only registered users can see the edit button on wiki pages
    Given I am logged in as "<user>" with password "secret"
    When I visit the "<page>" page
    Then I should <action>
	
    Examples:
      | user         | page | action         |
      | bob@test.com | home | see "Edit"     |
	  | fucker@t.com | home | not see "Edit" |
      |              | home | not see "Edit" |
	  
  # Scenario: create page
  
  # Scenario: delete page
  
  # Scenario: edit page