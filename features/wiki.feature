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
	
  Scenario: Create page
    Given I am logged in
	And I go to the lab page
	When I click in the link "create_page"
	Then I should see "New page"
	And I should fill in "page[name]" with "Test page"
	And I should fill in "page[slug]" with "test_page"
	And I should fill in "page[content]" with "Testing 1, 2, 3"
	And I click in the button "Create Page"
	Then I should see "Page was successfully created"
	And I should see "Test page"
	And I should see "Testing 1, 2, 3"
  
  Scenario: Delete page
    Given I have a page titled "test subject"
	And I am logged in
	And I go to the list of pages
	When I click in the link "Delete" of the "table tr:last-child" item
	Then I should not see "test subject"
  
  Scenario Outline: Only registered users can see the edit button on wiki pages
    Given I am logged in as "<user>" with password "secret"
    When I visit the "<page>" page
    Then I should <action>
	
    Examples:
      | user         | page | action         |
      | bob@test.com | home | see "Edit"     |
	  | fucking@u.me | home | not see "Edit" |
      |              | home | not see "Edit" |
  
  # Scenario: edit page
  