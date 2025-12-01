Feature: Testing GMO Product Catalog
  In order to verify product listings
  As a potential customer
  I need to validate the catalog displays correctly

  Background:
    Given the user navigates to GMO main page
    
  @maximize
  Scenario Outline: Validate product listing with pricing information
    When the user selects "Enter GMO Online"
    Then the page displays "These are the items currently available through our online catalog"
    And the catalog shows "<ProductName>" priced at "<Cost>"
    Examples:
      | ProductName             | Cost     |
      | Padded Socks            | $ 19.99  |
      | Back Country Shorts     | $ 24.95  |
      | Glacier Sun Glasses     | $ 67.99  |
      | Hiking Boots            | $ 109.90 |
      | External Frame Backpack | $ 179.95 |
      | 3 Person Dome Tent      | $ 299.99 |

  Scenario: Check information page details
    When the user navigates to "About the GMO Site"
    Then the information page loads successfully
    And the content contains "This is a sample online commerce application. It is not real."
    And the disclaimer states "Green Mountain Outpost is a fictitious company."
    And the security notice appears on screen


  Scenario: Validate browser compatibility page elements
    When navigating to "Browser Test Page"
    Then the heading reads "All Browsers Are Not Created Equal"
    And the browser list includes:
      | Netscape Navigator 3.0       |
      | Internet Explorer 3.0        |
    And these visual elements are present:
      | square bullets              |
      | circle bullets              |
      | dot bullets                 |
      | Blinking Text               |
    And the sidebar displays:
      | Table Properties            |
      | Trademarks are important    |
      | Definition Text Style       |
      | Colored Horizontal Rules    |
