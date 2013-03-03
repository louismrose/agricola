require "board"

describe Board do
  context "after a single field has been ploughed" do
    before(:each) do
      subject.plough_at 0, 3
    end
    
    it "should be ploughed at the given location" do
      subject.is_ploughed_at?(0, 3).should be_true
    end
    
    (0..6).each do |column|
      (0..2).each do |row|
        it "should not be ploughed at any other location" do
          subject.is_ploughed_at?(row, column).should be_false unless (row == 0 and column == 3)
        end
      end
    end
  end
  
  context "after a field has been sown" do
    before(:each) do
      subject.sow_at 0, 3
    end
    
    it "should contain extra grain at the given location" do
      subject.contents(0, 3).should == {grain: 3}
    end
    
    (0..6).each do |column|
      (0..2).each do |row|
        it "should not be sown at any other location" do
          subject.contents(row, column).should == {} unless (row == 0 and column == 3)
        end
      end
    end
  end
  
  context "after ploughing and sowing" do
    before(:each) do
      subject.plough_at 0, 3
      subject.sow_at 0, 3
    end
    
    it "should be a ploughed field at the given location" do
      subject.is_ploughed_at?(0, 3).should be_true
    end
    
    it "should contain extra grain at the given location" do
      subject.contents(0, 3).should == {grain: 3}
    end
  end
  
  context "after a stable has been placed" do
    before(:each) do
      subject.stable_at 0, 3
    end
    
    it "should be a stable at the given location" do
      subject.is_stable_at?(0, 3).should be_true
    end
    
    it "should contain extra animal housing" do
      subject.animal_housing.should == [{row: 0, column: 3, capacity: 1}]
    end
  end
end