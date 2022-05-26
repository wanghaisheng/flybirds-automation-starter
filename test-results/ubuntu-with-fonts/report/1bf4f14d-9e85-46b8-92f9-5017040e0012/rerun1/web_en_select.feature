# language: en

Feature:rerun failed scenario1

 
  Scenario: select option
Then information association of failed operation, run the 1 time :[ea568f87-d23b-481e-8410-3324ac56e06d]
    When go to url[携程]
    And from [#J_roomCountList] select [6间]
    And wait[5]seconds
    Then stop record

