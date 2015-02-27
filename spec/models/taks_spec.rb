require 'rails_helper'

describe Task do
	it { should belong_to :list }
	it { should validate_presence_of :list_id }
	it { should validate_presence_of :description }
end
