Feature: About this Page
   As a potential user
   I want to know about the page's pourpose
   so I can know what can and can't do on the page

Scenario: Entering the About Page
	Given I am on the GMO main page
	When I press the "About The GMO Site"
  Then I see what the page does
  And A warning about the information I'll enter

Scenario: Register on Guru99 page with a valid email        
    Given I am on the sample homepage
	When I enter "carlos@test.com" for Register
      And Press the "Submit" button
	Then I should see the following table:
    | User ID	     |  mngr23537  |
 	| Password       |  Ypegaza    | 

Scenario Outline: Register on Guru99 page with a several emails        
  Given I am on the sample homepage
  When I enter "<email>" for Register
    And Press the "Submit" button
  Then I should see <username> id
  
Examples:
    | email               | username    | 
    |  carlos@test.com    |  mngr135053 |
    |  pepe@hotmail.com   |  mngr123467 |	  
    |  lucas@gmail.com    |  mngr187654 |

