require "spec_helper"

feature "user adds grocery list item" do
  scenario "item name added when filled form submitted" do
    visit "/grocery-list"

    fill_in "Name", with: "Coke Zero"
    fill_in "Quantity", with: "5"
    click_on "Add"

    expect(page).to have_content("Coke Zero")
  end

  scenario "empty li element is not added when form missing name is submitted" do
    visit "/grocery-list"
    fill_in "Quantity", with: "5"
    click_on "Add"

    expect(page).not_to have_selector("li")
  end

  scenario "error message is displayed when form missing name is submitted" do
    visit "/grocery-list"
    fill_in "Quantity", with: "5"
    click_on "Add"

    expect(page).to have_content("Error")
  end

  scenario "quantity is pre-filled in form upon error" do
    visit "/grocery-list"
    fill_in "Quantity", with: "5"
    click_on "Add"

    expect(find_field('Quantity').value).to eq '5'
  end
end
