require 'rails_helper'

describe User do
	it { should have_many(:lists).dependent(:destroy) }
  it { should have_many(:favorites_lists).through(:favorites) }
  it { should have_many(:favorites).dependent(:destroy) }
end
