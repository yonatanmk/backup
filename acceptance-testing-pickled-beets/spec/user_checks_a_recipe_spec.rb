require "spec_helper"

feature "User checks a recipe's deliciousness"  do

  scenario "user submits a recipe name containing 'pickled beets'" do
    visit '/'
    fill_in 'Recipe Name', with: 'pickled beets'
    click_button 'Submit'

    expect(page).to have_content('"pickled beets" is a delicious recipe!')
  end

  scenario "user submits a recipe name without 'pickled beets'" do
    visit '/'
    fill_in 'Recipe Name', with: 'Roasted Brussel Sprouts'
    click_button 'Submit'

    expect(page).to have_content('"Roasted Brussel Sprouts" is not a delicious recipe!')
  end

  scenario "user navigates back to the home page after checking a recipe name" do
    visit '/'
    fill_in 'Recipe Name', with: 'Bacon'
    click_button 'Submit'
    click_link 'Try again!'

    expect(page).to have_content('Instructions: ')
  end

  scenario "user submits an empty form" do
    visit '/'
    fill_in 'Recipe Name', with: ''
    click_button 'Submit'

    expect(page).to have_content("You can't submit an empty recipe name!")
  end

  scenario "user navigates back to the home page after submitting an empty form" do
    visit '/'
    fill_in 'Recipe Name', with: ''
    click_button 'Submit'
    click_link 'Try again!'

    expect(page).to have_content('Instructions: ')
  end

end
