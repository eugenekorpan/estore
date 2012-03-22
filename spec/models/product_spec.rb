require 'spec_helper'

describe Product do
  let(:product) { Factory.build(:product) }

  context "validation" do
    it "should be valid" do
      product.should be_valid
    end
  end

  context "#published" do
    it "should be published" do
      product.update_attribute(:publish_at, Date.today - 2.months)
      product.published?.should be_true
    end

    it "should not be published" do
      product.update_attribute(:publish_at, Date.today + 1.months)
      product.published?.should be_false
    end
  end
  
end
