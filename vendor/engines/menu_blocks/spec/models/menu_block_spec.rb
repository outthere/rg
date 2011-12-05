require 'spec_helper'

describe MenuBlock do

  def reset_menu_block(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @menu_block.destroy! if @menu_block
    @menu_block = MenuBlock.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_menu_block
  end

  context "validations" do
    
    it "rejects empty name" do
      MenuBlock.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_menu_block
      MenuBlock.new(@valid_attributes).should_not be_valid
    end
    
  end

end