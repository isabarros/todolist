require 'rails_helper'

describe List do
	it { should belong_to :user }
	it { should have_many(:tasks).dependent(:destroy) }
	it { should validate_presence_of :user_id }
end