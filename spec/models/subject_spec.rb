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

describe Subject do
  pending "add some examples to (or delete) #{__FILE__}"
end
