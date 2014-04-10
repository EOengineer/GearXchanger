require 'spec_helper'

feature 'sign up' , %q{
  As an unauthenticated user
  I want to sign up
  So that I can gain access to site options
} do

  #I want to specify a first name
  #I want to specify a last name
  #I want to specify a valid email address
  #I want to specify a password, and confirm that password
  #If I do not enter valid information, I receive an error
  #If I specify valid information, I am registered and authenticated

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Login'
    fill_in 'First name', with: 'Jimi'
    fill_in 'Last name', with: 'Hendrix'
    fill_in 'Email', with: 'Jimi@Hendrix.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('What would you like to do?')
  end
end
