require 'spec_helper'

feature 'an authenticated user visits sale index', %q{
  As an authenticated user
  I want to be able to visit the sale index
  so I can see all the awesome instruments
  } do

#Acceptance Criteria:

#I will click a buy button that displays all the instruments in the database

  scenario 'user authenticates and visits index page' do
    visit root_path
    click_link('Login')
    fill_in 'Email', with: 'EOengineer@gmail.com'
    fill_in 'Password', with: 'password'
    click_button('Sign in')
    expect(page).to have_content('What would you like to do?')
    click_link 'Buy'
    expect(current_path).to eql(sales_path)
    expect(page).to have_content("Here are your results!")
  end
end
