require 'rails_helper'

# [] Selecting a category shows a list of all restaurant with that category.
# [] Visiting a restaurant show page displays the restaurant's categories with links to that category's show page

feature "visitor can visit a category" do
  scenario "category show page displays restaurants" do
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    mcdonalds = Restaurant.create(name: "Mcdonalds", address: "Beach streer", city: "Boston", state: "MA", zip: "02112")

    fast_food = Category.create(name: 'Fast Food')
    chinese = Category.create(name: 'Chinese' )
    american = Category.create(name: 'American')

    RestaurantCategory.create(restaurant: dumpling_king, category: chinese)
    RestaurantCategory.create(restaurant: mcdonalds, category: fast_food)
    RestaurantCategory.create(restaurant: mcdonalds, category: american)

    visit categories_path

    click_link "Fast Food"

    expect(page).to have_content "Fast Food Restaurants"
    expect(page).to have_content "Mcdonalds"

  end
  scenario "category show page links to restaurant show page" do
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    mcdonalds = Restaurant.create(name: "Mcdonalds", address: "Beach streer", city: "Boston", state: "MA", zip: "02112")

    fast_food = Category.create(name: 'Fast Food')
    chinese = Category.create(name: 'Chinese' )
    american = Category.create(name: 'American')

    RestaurantCategory.create(restaurant: dumpling_king, category: chinese)
    RestaurantCategory.create(restaurant: mcdonalds, category: fast_food)
    RestaurantCategory.create(restaurant: mcdonalds, category: american)

    visit categories_path

    click_link "Fast Food"

    click_link "Mcdonalds"

    expect(page).to have_content mcdonalds.name
    expect(page).to have_content mcdonalds.address
    expect(page).to have_content mcdonalds.city
    expect(page).to have_content mcdonalds.state
    expect(page).to have_content mcdonalds.zip
    expect(page).to have_content mcdonalds.description

    expect(page).to have_content 'Fast Food'
    expect(page).to have_content 'American'

  end
  scenario "restaurant show page links to category show page" do
    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    mcdonalds = Restaurant.create(name: "Mcdonalds", address: "Beach streer", city: "Boston", state: "MA", zip: "02112")

    fast_food = Category.create(name: 'Fast Food')
    chinese = Category.create(name: 'Chinese' )
    american = Category.create(name: 'American')

    RestaurantCategory.create(restaurant: dumpling_king, category: chinese)
    RestaurantCategory.create(restaurant: mcdonalds, category: fast_food)
    RestaurantCategory.create(restaurant: mcdonalds, category: american)

    visit restaurant_path(mcdonalds)

    click_link "American"

    expect(page).to have_content 'American Restaurants'
    expect(page).to have_content 'Mcdonalds'

  end
end
