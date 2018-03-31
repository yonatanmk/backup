require "spec_helper"

feature "user clicks on grocery item" do

  scenario "grocery list item links to item page" do
    visit "/grocery-list"

    fill_in "Name", with: "Apple"
    fill_in "Quantity", with: "5"
    click_on "Add"
    click_link 'Apple'

    expect(page).to have_current_path('/grocery-list/:Apple')
  end

  scenario "grocery item page contains item name" do
    visit "/grocery-list"

    fill_in "Name", with: "Apple"
    fill_in "Quantity", with: "5"
    click_on "Add"
    click_link 'Apple'

    expect(page).to have_content("Apple")
  end

  scenario "grocery item page contains item quantity" do
    visit "/grocery-list"

    fill_in "Name", with: "Apple"
    fill_in "Quantity", with: "5"
    click_on "Add"
    click_link 'Apple'

    expect(page).to have_content("5")
  end

end
