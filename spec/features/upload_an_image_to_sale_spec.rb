require 'spec_helper'


feature 'uploading a photo' do
  scenario 'user specifies valid input with a photo' do
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
    attach_file 'Image', Rails.root.join('spec/file_fixtures/valid_image.png')
    click_button 'Create Sale'
    expect(Sale.last.image.url).to be_present
    #expect(page).to have_content("Successfully created sale")
    expect(page).to_not have_content("can't be blank")
  end
end
