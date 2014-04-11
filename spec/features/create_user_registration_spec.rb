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
    click_link 'Register'
    fill_in 'First name', with: 'Jimi'
    fill_in 'Last name', with: 'Hendrix'
    fill_in 'Email', with: 'Jimi@Hendrix.com'
    find('#user_password').set('password')
    find('#user_password_confirmation').set('password')
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'specifying invalid information' do
    visit root_path
    click_link 'Register'
    fill_in 'First name', with: ''
    fill_in 'Last name', with: ''
    fill_in 'Email', with: ''
    find('#user_password_confirmation').set('')
    find('#user_password_confirmation').set('')
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
end
