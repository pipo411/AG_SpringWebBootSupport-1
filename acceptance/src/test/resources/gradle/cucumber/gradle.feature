Feature: Gradle-Cucumber integration
  @Gradle
  Scenario: Just a failing scenario
    Given A failing scenario
    When I run a failing step
    Then I got a failing step
    