@inventory
Feature: Inventory
  In order to keep track of all our stuff
  As an organization maniac
  I want to make a inventory list of all our parts, products and tools
  
  Background:
    Given I have a page titled "home"
    Given the following user records
    | email        | password |
    | bob@test.com | secret   |
  
  Scenario: list inventory items
    Given I have items
	When I go to the inventory page
	Then I should see "item1"
	And I should see "item2"
	
  Scenario: add item to inventory
    Given I am logged in
	And I am in the inventory page
	When I go click the button "Add item"
	Then I should see "create item"
	And I fill "item name" with "Canon 5D"
	And I should select "equipment" from the "category" select box
	And I fill "owner" with "bob"
	And I fill "location" with "fazenda"
	And I fill "description" with "Very good camera"
	And I fill "value" with "4500"
	And I fill "quantity" with "1"
	And I go click the button "Save"
	Then I should see "Item Created"
	And I should see "Canon 5D"
	
  # Scenario: delete inventory item
	
  # Scenario: edit inventory item
  
  # Scenario: show inventory item
  
  # Scenario: only users with permission can access the inventory list
  
  # Scenario: only users with permission can see the inventory link