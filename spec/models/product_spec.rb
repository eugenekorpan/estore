require 'spec_helper'

describe Product do
  let(:product) { Factory.build(:product) }

  context "validation" do
    it "should be valid" do
      product.should be_valid
    end

  end
  
end
