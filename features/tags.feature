@tags
Feature: Tag system
  In order to find related information in the system
  As an organized user
  I want to tag objects and find objects by tag
  
  Background:
    Given I have a tag named "testing"
	And I have a tag named "new tag"
    And I have the following blog posts
    | title       | content       | user_id |        slug |
	| Cool post   | Awesome Stuff |       1 |   cool_test |
	| Hello World | First post    |       1 | hello_world |
    And I have the following wiki pages
    | name  | content       |  slug |
	| home  | HE Lab        |  home |
	| stuff | random things | stuff |
	And I have the following taggings
	| tag_id | taggable_id | taggable_type |
	|      1 |           1 |          Post |
	|      1 |           2 |          Page |
	|      2 |           1 |          Post |
	|      2 |           2 |          Page |
	|      1 |           2 |          Post |	
    And the following user records
    | email        | password |
    | bob@test.com | secret   |
  
  Scenario: List Tags
	When I go to the tags_index_path
	Then I should see "Tags"
	And I should see "testing (3)"
	And I should see "new tag (2)"
	
  Scenario: Page Tags
    When I visit the "lab/stuff" page
	Then I should see "testing"
	And I should see "new tag"
	
  Scenario: Post Tag
    When I visit the "hello_world" post
    Then I should see "testing"
    And I should not see "new tag"
	
  # Scenario: File Tag