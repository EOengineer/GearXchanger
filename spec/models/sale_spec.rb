require 'spec_helper'

describe Sale do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should ensure_inclusion_of(:state).in_array(Sale::STATES) }
  it { should have_valid(:title).when('guitbox', 'drumset') }
  it { should_not have_valid(:title).when(nil, '') }
  it { should have_valid(:description).when('super rad guitar', 'buy this') }
  it { should_not have_valid(:description).when(nil, '') }
  it { should have_valid(:price).when(15000, 10) }
  it { should_not have_valid(:price).when('', nil, '234?') }
  it { should have_valid(:city).when('Boston', 'New York') }
  it { should_not have_valid(:city).when(nil, '') }
  it { should have_valid(:state).when('MA', 'NY') }
  it { should_not have_valid(:state).when(nil, '') }
  it { should belong_to(:category) }
end
