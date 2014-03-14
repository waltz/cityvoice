# == Schema Information
#
# Table name: voice_files
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  short_name :string(255)
#

class VoiceFile < ActiveRecord::Base
  attr_accessible :url, :short_name
end
