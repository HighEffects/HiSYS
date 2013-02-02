@comments
Feature: Comments
  In order to comment on stuff posted on the system
  As an user
  I want to post and view comments
  
  Background:
    Given I have a page titled "home"
    Given I have the following blog posts
    | title       | content         | user_id |
	| Testing     | Testing 1, 2, 3 |       1 |
    Given the following user records
    | email        | password |
    | bob@test.com | secret   |
	| james@foda.s | secret   |
  
  Scenario: View post comments
    Given I have the following comments
    | content          | user_id | commentable_id | commentable_type |
    | First comment!   |       1 |              1 |             Post |
	| Testing comments |       2 |              1 |             Post |
	When I visit the "testing" post
	Then I should see "First comment!"
	And I should see "Testing comments"
	
  Scenario: View wiki page comments
    Given I have the following comments
    | content          | user_id | commentable_id | commentable_type |
    | First comment!   |       1 |              1 |             Page |
	| Testing comments |       2 |              1 |             Page |
	When I visit the "home" page
	And I click in the link "wiki-page-comments"
	Then I should see "First comment!"
	And I should see "Testing comments"

  Scenario: Create post comment
    Given I am logged in
	And I visit the "testing" post
	When I fill in "comment[content]" with "Post comment test"
	And I click in the button "Post Comment"
	Then I should see "Comment created."
	And I should see "Post comment test"
	
  Scenario: Create wiki comment
    Given I am logged in
	And I have a page titled "test"
	And I visit the "test" page
	When I click in the link "wiki-page-comments"
	And I fill in "comment[content]" with "Wiki page comment test"
	And I click in the button "Post Comment"
	Then I should see "Comment created."
	And I should see "Wiki page comment test"
	
  Scenario: Only logged in users can see the post comment button
    Given I visit the "home" page
	When I click in the link "wiki-page-comments"
	Then I should not see "Create Comment"
	
  Scenario: Only logged in users can see the page comment button
    Given I visit the "testing" post
  	Then I should not see "Create Comment"
