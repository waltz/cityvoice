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

class Property < Subject
  has_one :property_info_set
  has_many :feedback_inputs
  has_many :notification_subscriptions

  validates :name, presence: true

  before_save :add_call_in_code
  attr_protected

  def add_call_in_code
    street_number = name[0..name.index(" ")]
    street_number_matcher = case street_number.length
                            when 4
                              "%#{street_number}"
                            when 3
                              "%#{street_number}%"
                            when 2
                              "{}"
                            end
    properties_with_similar_codes = Property.where("property_code like ?", street_number_matcher)
    existing_similar_codes = properties_with_similar_codes.map { |e| e.property_code }
  end

  scope :activity_since, ->(time) { where("most_recent_activity >= ?", time) }

  # called by feedback_inputs to indicate activity
  def new_activity!
    update_attributes(most_recent_activity: DateTime.now)
  end

  def url_to
    name_link = self.name.gsub(' ', '-')
    path = "/subjects/#{name_link}"
  end
end
