require "supply"

def resource_types
  Supply.resource_types
end

def resource_types_without(excluded_resource)
  resource_types - [excluded_resource]
end

describe Supply do
  context "when new" do
    resource_types.each do |resource|
      it "should have no #{resource}" do
        subject.amount_of(resource).should == 0 
      end
    end
  end
  
  resource_types.each do |resource|
    context "after gathering 3 #{resource}" do
      before(:each) do
        subject.gather(3, resource)
      end
    
      it "should have 3 #{resource}" do
        subject.amount_of(resource).should == 3
      end

     resource_types_without(resource).each do |other_resource|
        it "should have no #{other_resource}" do
          subject.amount_of(other_resource).should == 0
        end
      end
    end
  end
  
  resource_types.each do |resource|
    context "after gathering 3 #{resource} and 2 #{resource}" do
      before(:each) do
        subject.gather(3, resource)
        subject.gather(2, resource)
      end

      it "should have 5 #{resource}" do
        subject.amount_of(resource).should == 5
      end

      resource_types_without(resource).each do |other_resource|
        it "should have no #{other_resource}" do
          subject.amount_of(other_resource).should == 0
        end
      end
    end
  end
end