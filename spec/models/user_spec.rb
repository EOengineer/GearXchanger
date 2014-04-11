require 'spec_helper'

describe User do
  it { should have_valid(:first_name).when('Homer', 'Ned') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Simpson', 'Flanders') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('homer@simpsons.com') }
  it { should_not have_valid(:email).when(nil, '', 'bob', 234) }

  it 'has a matching confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = "notthesame"

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
