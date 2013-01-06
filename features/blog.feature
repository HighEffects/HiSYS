@blog
Feature: Blog
  In order to post content
  As an writer
  I want a basic blog
  
  Background:
    Given the following blog posts
    | title       | content                      |
	| Testing     | Testing 1, 2, 3              |
    | Hello World | This is the first blog post! |

  Scenario: list posts
	When I go to the blog
	Then I should see "Testing"
	And I should see "Hello World"
  
  Scenario: create post
    Given I am logged in
	And I am in the blog page
	When I go click the button "Create Post"
	Then I should see "Create Post"
	And I should fill "title" with "Posting Test"
	And I should fill "content" with "This is a post created by cucumber!"
	And I go click the button "Post"
	Then I should see "Post Created"
	And I should see "Posting Test"
  
  # Scenario: delete post
	
  # Scenario: edit post
  
  # Scenario: show post
  
  # Scenario: only author can edit post
  
  