@enrollments
Feature: Enrollments
  In order to have enrollments on my website
  As an administrator
  I want to manage enrollments

  Background:
    Given I am a logged in refinery user
    And I have no enrollments

  @enrollments-list @list
  Scenario: Enrollments List
   Given I have enrollments titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of enrollments
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @enrollments-valid @valid
  Scenario: Create Valid Enrollment
    When I go to the list of enrollments
    And I follow "Add New Enrollment"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 enrollment

  @enrollments-invalid @invalid
  Scenario: Create Invalid Enrollment (without name)
    When I go to the list of enrollments
    And I follow "Add New Enrollment"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 enrollments

  @enrollments-edit @edit
  Scenario: Edit Existing Enrollment
    Given I have enrollments titled "A name"
    When I go to the list of enrollments
    And I follow "Edit this enrollment" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of enrollments
    And I should not see "A name"

  @enrollments-duplicate @duplicate
  Scenario: Create Duplicate Enrollment
    Given I only have enrollments titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of enrollments
    And I follow "Add New Enrollment"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 enrollments

  @enrollments-delete @delete
  Scenario: Delete Enrollment
    Given I only have enrollments titled UniqueTitleOne
    When I go to the list of enrollments
    And I follow "Remove this enrollment forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 enrollments
 