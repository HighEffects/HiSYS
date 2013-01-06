@search
Feature: Search
  In order to find information on the system
  As an normal user
  I want to search the system
  
  Scenario: wiki search
    Given I have the following wiki pages
    | name         | slug         | content         |
	| Home         | home         | bla bla bla bla |
    | Testing page | testing_page | bla bla bla bla |
    | Hello World  | hello_world  | Testing 1, 2, 3 |
	| Teapot       | teapot       | no info here    |  
    When I go to the lab page
	And I should fill in "search" with "test"
	And I click in the button "Find"
	Then I should see "Results for test"
	And I should see "Testing page"
	And I should see "Hello World"
	And I should not see "Teapot"