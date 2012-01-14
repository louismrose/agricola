require "supply"
require "farm"

def resource_types_pattern
  Supply.resource_types.join('|')
end

Given /^an empty farm$/ do
  @farm = Farm.new
end

Given /^a farm with a ploughed field at location ([A-Z])(\d)$/ do |column, row|
  steps %Q{
    Given an empty farm
    When I plough a field at location #{column + row} 
  }
end

When /^I pick up (\d+) (#{resource_types_pattern})$/ do |amount, resource_type|
  @farm.supply.gather amount.to_i, resource_type.to_sym
end

When /^I plough a field at location ([A-Z])(\d)$/ do |column, row|
  @farm.board.plough_at row, column
end

Then /^my farm should have (\d+) (#{resource_types_pattern})$/ do |expected_amount, resource_type|
  @farm.supply.amount_of(resource_type.to_sym).should == expected_amount.to_i
end

Then /^my farm should have (\d+) ploughed fields?$/ do |expected_amount|
  @farm.board.number_of_ploughed_fields.should == expected_amount.to_i
end

Then /^the tile at location ([A-Z])(\d) should be a ploughed field$/ do |column, row|
  @farm.board.is_ploughed_at?(row, column).should be_true
end