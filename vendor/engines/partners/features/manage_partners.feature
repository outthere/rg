@partners
Feature: Partners
  In order to have partners on my website
  As an administrator
  I want to manage partners

  Background:
    Given I am a logged in refinery user
    And I have no partners

  @partners-list @list
  Scenario: Partners List
   Given I have partners titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of partners
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @partners-valid @valid
  Scenario: Create Valid Partner
    When I go to the list of partners
    And I follow "Add New Partner"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 partner

  @partners-invalid @invalid
  Scenario: Create Invalid Partner (without name)
    When I go to the list of partners
    And I follow "Add New Partner"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 partners

  @partners-edit @edit
  Scenario: Edit Existing Partner
    Given I have partners titled "A name"
    When I go to the list of partners
    And I follow "Edit this partner" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of partners
    And I should not see "A name"

  @partners-duplicate @duplicate
  Scenario: Create Duplicate Partner
    Given I only have partners titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of partners
    And I follow "Add New Partner"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 partners

  @partners-delete @delete
  Scenario: Delete Partner
    Given I only have partners titled UniqueTitleOne
    When I go to the list of partners
    And I follow "Remove this partner forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 partners
 