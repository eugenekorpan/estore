require 'spec_helper'

describe Showroom do
  let(:showroom) { Factory.build(:showroom) }

  context "validation" do
    it "should be valid" do
      showroom.should be_valid
    end

    it "should require title" do
      showroom.title = nil
      showroom.should_not be_valid
    end
  end
  
end
