# == Schema Information
#
# Table name: subjects
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  neighborhood_id      :integer
#  type                 :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  property_code        :string(255)
#  parcel_id            :string(255)
#  lat                  :string(255)
#  long                 :string(255)
#  description          :text
#  most_recent_activity :datetime
#

require 'spec_helper'

describe Property do
  describe "#new_activity!" do
    before do
      Timecop.freeze
    end
    after do
      Timecop.return
    end
    it "sets the most_recent_activity to the current time" do
      prop = FactoryGirl.create(:property)
      prop.new_activity!
      prop.most_recent_activity.should eq(DateTime.now)
    end
  end

  it "adds an appropriate call-in code based on street number (in name)" do

  end
end
