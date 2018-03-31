require 'spec_helper'
require_relative "../config/application"

feature "Index page" do
  before (:each) do
    Project.create!(description: 'Make something out of wood', name: 'Woodworking')
    Project.create!(description: 'Make something out of metal', name: 'Metalworking')
    Project.create!(description: 'Exercise', name: 'Work out')
  end

  scenario "user visits index page" do
    visit '/'
    expect(page).to have_content "Projects"
    expect(page).to have_content "Woodworking"
    expect(page).to have_content "Work out"
  end

end

feature "Show page" do
  before (:each) do
    User.create!(first_name: 'Steve', last_name: 'Michaels', email: 'steve@gmail.com')
    User.create!(first_name: 'Michael', last_name: 'Stevens')
    Project.create!(description: 'Make something out of wood', name: 'Woodworking')
    Project.create!(description: 'Make something out of metal', name: 'Metalworking')
    Project.create!(name: 'Work out')
    UserProject.create!(user: User.first, project: Project.first)
    UserProject.create!(user: User.first, project: Project.find_by(name: 'Metalworking'))
    UserProject.create!(user: User.last, project: Project.find_by(name: 'Metalworking'))
    UserProject.create!(user: User.last, project: Project.last)
    Task.create!(name: 'Learn Woodworking', description: 'Take a class on woodworking or ask Fred', due_date: '02/23/2017', project: Project.first)
    Task.create!(name: 'Buy wood', description: 'Go to the store and buy wood', due_date: '02/28/2017', project: Project.first, user: User.first)

    #Note to self: Learn FactoryGirl
  end

  scenario "user visits woodworking page" do
    visit '/'
    click_link "Woodworking"
    expect(page).to have_content "Woodworking"
    expect(page).to have_content "Desc: Make something out of wood"
    expect(page).to have_content "Steve Michaels, steve@gmail.com"
    expect(page).to have_content "Tasks:"
    expect(page).to have_content "Learn Woodworking"
    expect(page).to have_content "Take a class on woodworking or ask Fred"
    expect(page).to have_content "Buy wood"
    expect(page).to have_content "Go to the store and buy wood"
    expect(page).to have_content "Assigned to: Steve Michaels"
  end

  scenario "user visits metalworking page" do
    visit '/'
    click_link "Metalworking"
    expect(page).to have_content "Michael Stevens"
    expect(page).to have_content "Steve Michaels, steve@gmail.com"
  end

  scenario "user visits work out page" do
    visit '/'
    click_link "Work out"
    expect(page).to have_content "Work out"
    expect(page).to have_content "Desc:"
    expect(page).to have_content "Michael Stevens"
    expect(page).to have_content "Tasks:"
  end

end
