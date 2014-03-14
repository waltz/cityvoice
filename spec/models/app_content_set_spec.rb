# == Schema Information
#
# Table name: app_content_sets
#
#  id                  :integer          not null, primary key
#  issue               :string(255)
#  learn_text          :text
#  call_text           :string(255)
#  call_instruction    :string(255)
#  app_phone_number    :string(255)
#  listen_text         :string(255)
#  message_from        :string(255)
#  message_url         :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  header_color        :string(255)
#  short_title         :string(255)
#  call_in_code_digits :string(1)
#  feedback_form_url   :string(255)
#

require 'spec_helper'

describe AppContentSet do
  pending "add some examples to (or delete) #{__FILE__}"
end
