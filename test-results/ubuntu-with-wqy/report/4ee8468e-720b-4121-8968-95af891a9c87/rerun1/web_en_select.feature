# language: en

Feature:rerun failed scenario1

 
  Scenario: select option
Then information association of failed operation, run the 1 time :[7c0aa04d-e2c7-40b1-98ee-f7aee3d79313]
    When go to url[携程]
    And from [#J_roomCountList] select [6间]
    And wait[5]seconds
    Then stop record

