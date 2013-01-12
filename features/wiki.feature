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
	And I fill in "page[name]" with "Test page"
	And I fill in "page[slug]" with "test_page"
	And I fill in "page[content]" with "Testing 1, 2, 3"
	And I click in the button "Create Page"
	Then I should see "Page was successfully created"
	And I should see "Testing 1, 2, 3"
  
  Scenario: Delete page
    Given I have a page titled "test subject"
	And I am logged in
	And I go to the list of pages
	When I click in the link "Delete" of the "table tr:last-child" item
	Then I should not see "test subject"
	
  Scenario: Edit page
    Given I am logged in
	And I have a page titled "test"
	When I visit the "lab/test" page
	And I click in the link "edit-wiki-page"
	And I should see "Editar página"
	And I fill in "page[content]" with "Testing 1, 2, 3"
	And I click in the button "Update Page"
	Then I should see "Page was successfully updated"
	And I should see "Testing 1, 2, 3"
  
  Scenario Outline: Only registered users can see the edit button on wiki pages
    Given I am logged in as "<user>" with password "secret"
    When I visit the "<page>" page
    Then I should <action> css tag
	
    Examples:
      | user         | page | action                 |
      | bob@test.com | home | see "i.icon-pencil"     |
	  | fucking@u.me | home | not see "i.icon-pencil" |
      |              | home | not see "i.icon-pencil" |
  
  @subpages
  Scenario: Subpages
    Given I have a page titled "level_1"
    And I have a page with parent "1" and titled "level_2"
	Then I visit the "lab/level_1/level_2" page
	And I should see "level_2"
  
  @subpages
  Scenario: Creating subpages
    Given I am logged in
	And I go to the lab page
    Given I have a page titled "level_1"
	When I click in the link "create_page"
	And I fill in "page[name]" with "Level 2"
	And I fill in "page[slug]" with "level_2"
	And I fill in "page[content]" with "Level 2 Testing"
	And I should select "level_1" in "page[parent_id]"
	And I click in the button "Create Page"
	Then I visit the "lab/level_1/level_2" page
	And I should see "Level 2 Testing"
  
  @subpages
  Scenario: Editing subpages
    Given I am logged in
    And I have a page titled "level_1"
    And I have a page with parent "1" and titled "level_2"
	When I visit the "lab/level_1/level_2" page
	And I click in the link "edit-wiki-page"
	And I fill in "page[content]" with "Testing 1, 2, 3"
	And I click in the button "Update Page"
	Then I should see "Page was successfully updated"
	And I should see "Testing 1, 2, 3"