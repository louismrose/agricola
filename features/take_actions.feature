Feature: Take actions
  In order to play Agricola
  As a player
  I want to carry out actions on my turn

	Scenario Outline: Pick up resources
	  Given an empty farm
	  When I pick up <amount> <resource>
	  Then my farm should have <amount> <resource>
	
		Scenarios:
		 | amount | resource  |
		 | 3      | wood      |
		 | 2      | clay      |
		 | 1      | stone     |
		 | 5      | reed      |
		 | 1      | grain     |
     | 1      | vegetable |
  
  Scenario: Ploughing the first field
    Given an empty farm
    When I plough a field at location A1
    Then my farm should have 1 ploughed field
    And  the tile at location A1 should be a ploughed field
  
  # Scenario: Not allowed to plough the second field away from the first field    
  