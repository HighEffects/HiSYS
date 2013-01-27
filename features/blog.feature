@blog
Feature: Blog
  In order to post content
  As an writer
  I want a basic blog
  
  Background:
    Given I have a page titled "home"
    Given I have the following blog posts
    | title       | content                      | user_id |
	| Testing     | Testing 1, 2, 3              |       1 |
    | Hello World | This is the first blog post! |       1 |
    Given the following user records
    | email        | password |
    | bob@test.com | secret   |

  Scenario: list posts
	When I go to the blog
	Then I should see "Testing"
	And I should see "Hello World"
  
  Scenario: create post
    Given I am logged in
	And I go to the blog
	When I click in the link "create_post"
	Then I should see "New post"
	And I fill in "post[title]" with "Posting Test"
	And I fill in "post[slug]" with "posting_test"
	And I fill in "post[content]" with "This is a post created by cucumber!"
	And I click in the button "Create Post"
	Then I should see "Post was successfully created"
	And I should see "Posting Test"
  
  # Scenario: delete post
	
  # Scenario: edit post
  
  # Scenario: show post
  
  # Scenario: only author can edit post
  
  