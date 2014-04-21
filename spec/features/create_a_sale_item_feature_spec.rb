require 'spec_helper'

feature 'an authenticated user creates a listing', %q{
As an authenticated user
I want to choose to sell an instrument
So that I can help someone else shred harder
  } do

#Acceptance Criteria:

#I will click a Sell button that displays a form to provide details
#I must specify a posting title
#I must provide a posting description
#I must provide a posting city
# I must select a posting state
# I must provide a price
# I can optionally provide a phone number
# I can optionally provide an image
# I can then click a submit button to post the sale item
# I will recieve a message that the post was successful
# I will be redirected to the respective sale item

  scenario 'user specifies valid input' do
    FactoryGirl.create(:category)
    visit new_sale_url
    expect(page).to have_content('Tell us about what you are selling!')
    fill_in 'Title', with: '1962 Fender Stratocaster'
    fill_in 'Description', with: 'super awesome guitar'
    select('Guitar', from: 'Category')
    fill_in 'City', with: 'Boston'
    select 'MA', from: 'State'
    fill_in 'Price', with: '20,000'
    fill_in 'Phone number', with: '617-555-6789'
    click_button 'Create Sale'
    #expect(page).to have_content("Successfully created sale")
    expect(page).to_not have_content("can't be blank")
  end

  scenario 'user specifies invalid input' do
    visit new_sale_url
    expect(page).to have_content('Tell us about what you are selling!')
    click_button 'Create Sale'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Successfully created sale')
  end
end
