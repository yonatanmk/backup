require "rails_helper"

# [] Visiting the `/restaurants/new` path should display a form for creating a new restaurant with checkboxes for categories.
# [] When adding a new restaurant, if I fill out the form correctly, I should see the page for the newly created restaurant with the categories present.

feature "visitors can add restaurants with" do
  scenario "visitor adds new restaurant successfully with categories" do

    Category.create(name: 'Italian')

    visit new_restaurant_path
    expect(page).to have_content "New Restaurant Form"
    expect(page).to have_content "Italian"

    fill_in 'Name', with: "Figaro's"
    fill_in 'Address', with: "105 Beach St"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Zip', with: "02111"
    check('Italian')
    fill_in 'Description', with: "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."

    click_button "Add Restaurant"

    expect(page).to have_content "Restaurant added successfully"
    expect(page).to have_content "Figaro's"
    expect(page).to have_content "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."
    expect(page).to have_content "Italian"
  end
end
