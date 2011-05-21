
Feature: Testing Regexp
  In order to experiment flex regular expressions
  As a Flex developper
  I want to test a flex regular expression on some string

  Scenario: Test regexp with single match
    When I type "xxxxabcdxxxx" in the "Text:" text area
    And I type "/a.cd/" in the "Regular expression:" text field
    And I click the "Tester" button
    Then I should see "abcd" in the "Result:" label

  Scenario: Test regexp with two matches
    When I type "xxxxabcdxxaadcxx" in the "Text:" text area
    And I type "/a.cd/" in the "Regular expression:" text field
    And I click the "Tester" button
    Then I should see "abcd,aadc" in the "Result:" label

  Scenario: Test regexp with no match
    When I type "xxxxabcdxxxx" in the "Text:" text area
    And I type "/a.cd/" in the "Regular expression:" text field
    And I click the "Tester" button
    Then I should see "No match !" in the "Result:" label
