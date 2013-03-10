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
    
  Scenario: Sowing a field
   Given a farm with a ploughed field at location A1
   And   my farm has 1 grain
   When  I sow grain into A1
   Then  the tile at location A1 should contain 3 grain
   And   my farm should have 0 grain
 	
	Scenario: Place a stable
		Given an empty farm
    When I place a stable at location A1
    Then my farm should have the following animal housing:
			| column | row | capacity |
			| A      | 1   | 1        |
    And  the tile at location A1 should be a stable
	
	Scenario Outline: Take an animal
	  Given an empty farm
	  When I pick up 1 <animal>
	  Then my farm should have 1 <animal>
	  And my house should contain 1 <animal>
	  
	  Scenarios:
		 | animal |
		 | sheep  |
		 | boar   |
		 | cattle |
	
  # Other actions
  # - Take sheep / cattle / boar / food
  # - "Swap a resource" e.g. pay 1 food for 1 cattle
  # - Bake bread
  # - Buy improvement (sometimes with a cost / pre-req )
  # - Play occupation (sometimes with a cost / pre-req)
  # - Place fences
  # - Renovate
  # - Build a room
  # - Family growth
  # - Become the starting player
  
  # Validation of actions