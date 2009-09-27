Feature: Item
  In order to value
  As a role
  I want feature


  Scenario: Adding a new item
    Given I am signed up and confirmed as "email@person.com/password"
    And  I sign in as "email@person.com/password"
    And  I am on my items page
     When I follow "Add Item"
      And I fill in "title" with "My title"
      And I fill in "description" with "My description"
      And I press "Create"
     Then I should see "Item successfully created."
      And I should see "My title"



  


