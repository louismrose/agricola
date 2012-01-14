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
end