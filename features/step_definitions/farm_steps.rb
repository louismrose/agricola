require "supply"
require "farm"
require "house"

def resource_types_pattern
  Supply.resource_types.join('|')
end

def animal_types_pattern
  House.animal_types.join('|')
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

Given /^my farm has (\d+) (#{resource_types_pattern})$/ do |amount, resource_type|
  @farm.gather amount.to_i, resource_type.to_sym
end

When /^I pick up (\d+) (#{resource_types_pattern})$/ do |amount, resource_type|
  @farm.gather amount.to_i, resource_type.to_sym
end

When /^I plough a field at location ([A-Z])(\d)$/ do |column, row|
  @farm.plough_at row, column
end

When /^I sow grain into ([A-Z])(\d)$/ do |column, row|
  @farm.sow_at row, column
end

When(/^I place a stable at location ([A-Z])(\d)$/) do |column, row|
  @farm.stable_at row, column
end

Then /^my farm should have (\d+) (#{resource_types_pattern})$/ do |expected_amount, resource_type|
  @farm.supply.amount_of(resource_type.to_sym).should == expected_amount.to_i
end

Then /^my farm should have (\d+) ploughed fields?$/ do |expected_amount|
  @farm.board.number_of_ploughed_fields.should == expected_amount.to_i
end

Then(/^my farm should have the following animal housing:$/) do |table|
  @farm.board.animal_housing.should == table.hashes.map do |row| 
    symbolised_row = row.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    symbolised_row[:capacity] = symbolised_row[:capacity].to_i
    symbolised_row
  end
end

Then /^the tile at location ([A-Z])(\d) should be a ploughed field$/ do |column, row|
  @farm.board.is_ploughed_at?(row, column).should be_true
end

Then(/^the tile at location ([A-Z])(\d) should be a stable$/) do |column, row|
  @farm.board.is_stable_at?(row, column).should be_true
end

Then /^the tile at location ([A-Z])(\d+) should contain (\d+) (#{resource_types_pattern})$/ do |column, row, amount, resource_type|
  @farm.board.contents(row, column).should == {resource_type.to_sym => amount.to_i}
end

Then(/^my house should contain (\d+) (#{animal_types_pattern})$/) do |amount, animal_type|
  @farm.house.animals[animal_type.to_sym].should == amount.to_i
end
