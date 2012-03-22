require 'spec_helper'

describe Showroom do
  let(:showroom) { Factory.build(:showroom) }
  let(:showroom_with_product) { Factory.create(:showroom) }
  let!(:product) { Factory.create(:product, :showroom => showroom_with_product) }

  context "validation" do
    it "should be valid" do
      showroom.should be_valid
    end

    it "should require title" do
      showroom.title = nil
      showroom.should_not be_valid
    end
  end

  context "counter cache" do
    it "should increment counter" do
      showroom.products.should be_blank
      expect {
        Factory.create(:product, :showroom => showroom)
        showroom.reload
      }.to change { showroom.products_count }.by(1)
    end

    it "should descrise counter" do
      showroom_with_product.reload
      showroom_with_product.products_count.should == 1
      expect {
        product.destroy
        showroom_with_product.reload
      }.to change { showroom_with_product.products_count }.by(-1)
    end
  end
  
end
