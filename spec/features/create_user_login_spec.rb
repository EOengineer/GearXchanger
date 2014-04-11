require 'spec_helper'

feature 'Login', %q{
  As an unauthenticated user
  I want to login
  So that I can gain access to the site features
} do


  #Acceptance Criteria:
  # If I specify a valid, previosly registered email and password
  # I am authenticated and gain access to site features
  # If I specify invalid information, I do not gain access
  # If I am already singed in, I can't sign in again


  scenario 'an existing user provides valid credentials' do
  user = FactoryGirl.create(:user)
  visit root_path
  click_link 'Login'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
  expect(page).to have_content('Welcome Back!')
  end

  scenario 'non registered credentials provided' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'nothereyet@oops.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    expect(page).to_not have_content('Welcome Back')
    expect(page).to have_content('Invalid email or password.')
  end
end
