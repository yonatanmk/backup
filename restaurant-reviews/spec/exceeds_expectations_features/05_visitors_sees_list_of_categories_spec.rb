require 'rails_helper'

# [] Visiting any path should contain a link to the categories index.
# [] Visiting the `/categories` path should show a list of categories

feature "visitor sees a list of categories at /categories" do
  scenario "categories link on every page" do
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    mcdonalds = Restaurant.create(name: "Mcdonalds", address: "Beach streer", city: "Boston", state: "MA", zip: "02112")

    fast_food = Category.create(name: 'Fast Food')
    chinese = Category.create(name: 'Chinese' )
    american = Category.create(name: 'American')

    visit restaurants_path
    expect(page).to have_content "Categories"

    visit restaurant_path(mcdonalds)
    expect(page).to have_content "Categories"

    visit new_restaurant_path
    expect(page).to have_content "Categories"

    visit new_restaurant_review_path(mcdonalds)
    expect(page).to have_content "Categories"

    visit categories_path
    expect(page).to have_content "Categories"

    visit category_path(american)
    expect(page).to have_content "Categories"

  end
  scenario "visitor sees a list of catgories on category index page" do
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    mcdonalds = Restaurant.create(name: "Mcdonalds", address: "Beach streer", city: "Boston", state: "MA", zip: "02112")

    fast_food = Category.create(name: 'Fast Food')
    chinese = Category.create(name: 'Chinese' )
    american = Category.create(name: 'American')

    visit restaurants_path

    expect(page).to have_content "Categories"

    click_link "Categories"

    expect(page).to have_content "Fast Food"
    expect(page).to have_content "Chinese"
    expect(page).to have_content "American"
  end
end
