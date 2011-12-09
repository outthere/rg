require 'spec_helper'

describe Enrollment do

  def reset_enrollment(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @enrollment.destroy! if @enrollment
    @enrollment = Enrollment.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_enrollment
  end

  context "validations" do
    
    it "rejects empty name" do
      Enrollment.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_enrollment
      Enrollment.new(@valid_attributes).should_not be_valid
    end
    
  end

end