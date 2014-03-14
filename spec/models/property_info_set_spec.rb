# == Schema Information
#
# Table name: property_info_sets
#
#  id                      :integer          not null, primary key
#  property_id             :integer
#  condition_code          :integer
#  condition               :string(255)
#  estimated_cost_exterior :string(255)
#  estimated_cost_interior :string(255)
#  demo_order              :string(255)
#  recommendation          :string(255)
#  outcome                 :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  lat                     :string(255)
#  long                    :string(255)
#

require 'spec_helper'

describe PropertyInfoSet do
  it "can be created with a property" do
    @p = Property.create(:name => "456 Test St")
    @p.property_info_set = PropertyInfoSet.create(:condition_code => 5, :condition => "Poor")
    @p.property_info_set.condition_code.should eq(5)
  end
end
