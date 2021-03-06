# == Schema Information
#
# Table name: subjects
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  type                 :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  most_recent_activity :datetime
#  lat                  :string(255)
#  long                 :string(255)
#  description          :text
#

require 'spec_helper'

describe Property do
  subject(:property) { create(:property) }

  it { should have_one :property_info_set }
  it { should have_many :notification_subscriptions }

  describe '.activity_since' do
    let!(:property) { create(:property, most_recent_activity: Time.now) }

    context 'when the most recent activity is before the time' do
      it 'does not return the property' do
        expect(Property.activity_since(Time.now + 1.day)).to be_empty
      end
    end

    context 'when the most recent activity is after the time' do
      it 'returns the property' do
        expect(Property.activity_since(1.day.ago)).to eq([property])
      end
    end
  end

  its(:url_to) { should == '/subjects/1234-Fake-St' }

  describe '#new_activity!' do
    it 'sets the most recent activity' do
      Timecop.freeze(DateTime.parse('December 23, 2013')) do
        expect {
          property.new_activity!
        }.to change { property.reload.most_recent_activity }.to(Time.now)
      end
    end
  end
end
