require 'spec_helper'

describe Partner do

  def reset_partner(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @partner.destroy! if @partner
    @partner = Partner.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_partner
  end

  context "validations" do
    
    it "rejects empty name" do
      Partner.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_partner
      Partner.new(@valid_attributes).should_not be_valid
    end
    
  end

end