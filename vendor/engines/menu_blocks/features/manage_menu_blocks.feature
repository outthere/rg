@menu_blocks
Feature: Menu Blocks
  In order to have menu_blocks on my website
  As an administrator
  I want to manage menu_blocks

  Background:
    Given I am a logged in refinery user
    And I have no menu_blocks

  @menu_blocks-list @list
  Scenario: Menu Blocks List
   Given I have menu_blocks titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of menu_blocks
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @menu_blocks-valid @valid
  Scenario: Create Valid Menu Block
    When I go to the list of menu_blocks
    And I follow "Add New Menu Block"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 menu_block

  @menu_blocks-invalid @invalid
  Scenario: Create Invalid Menu Block (without name)
    When I go to the list of menu_blocks
    And I follow "Add New Menu Block"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 menu_blocks

  @menu_blocks-edit @edit
  Scenario: Edit Existing Menu Block
    Given I have menu_blocks titled "A name"
    When I go to the list of menu_blocks
    And I follow "Edit this menu_block" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of menu_blocks
    And I should not see "A name"

  @menu_blocks-duplicate @duplicate
  Scenario: Create Duplicate Menu Block
    Given I only have menu_blocks titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of menu_blocks
    And I follow "Add New Menu Block"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 menu_blocks

  @menu_blocks-delete @delete
  Scenario: Delete Menu Block
    Given I only have menu_blocks titled UniqueTitleOne
    When I go to the list of menu_blocks
    And I follow "Remove this menu block forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 menu_blocks
 