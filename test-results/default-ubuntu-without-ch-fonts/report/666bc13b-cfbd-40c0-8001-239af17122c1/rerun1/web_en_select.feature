# language: en

Feature:rerun failed scenario1

 
  Scenario: select option
Then information association of failed operation, run the 1 time :[68b0160b-5c29-4649-a628-e178d123db5d]
    When go to url[携程]
    And from [#J_roomCountList] select [6间]
    And wait[5]seconds
    Then stop record

