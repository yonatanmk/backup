require "spec_helper"

feature "user sees grocery list" do
  scenario "user views all grocery list item names" do
    CSV.open("grocery_list.csv", "a", headers: true) do |file|
      name = "tacos"
      quantity = "5"
      file.puts([name])
      file.puts([quantity])
    end

    visit "/grocery-list"
    expect(page).to have_content("tacos")
  end

  scenario "user views all grocery list item quantities" do
    CSV.open("grocery_list.csv", "a", headers: true) do |file|
      name = "tacos"
      quantity = "5"
      file.puts([name])
      file.puts([quantity])
    end

    visit "/grocery-list"
    expect(page).to have_content("5")
  end


  scenario "user sees all grocery items at root path" do
    CSV.open("grocery_list.csv", "a", headers: true) do |file|
      name = "tacos"
      quantity = "5"
      file.puts([name])
      file.puts([quantity])
    end

    visit "/"
    expect(page).to have_content("tacos")
  end

  scenario "user sees all grocery item quantities at root path" do
    CSV.open("grocery_list.csv", "a", headers: true) do |file|
      name = "tacos"
      quantity = "5"
      file.puts([name])
      file.puts([quantity])
    end

    visit "/"
    expect(page).to have_content("5")
  end
end
