require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do

    visit "/television_shows"
    click_link('Add New Show')
    fill_in('Title:', :with => 'Married... with Children')
    fill_in('Network:', :with => 'Fox')
    fill_in('Starting Year:', :with => '1987')
    fill_in('Ending Year:', :with => '1997')
    select("Comedy", :from => "genre")
    fill_in('Synopsis:', :with => 'Al Bundy is an unsuccessful middle aged shoe salesman with a miserable life and an equally dysfunctional family. ... He hates his job, his wife is lazy, his son is dysfunctional (especially with women), and his daughter is dim-witted and promiscuous.')
    click_button('Add TV Show')
    # visit "/television_shows"
    click_link('Married... with Children (Fox)')

    expect(page).to have_content('Married... with Children')
    expect(page).to have_content('Fox')
    expect(page).to have_content('1987 - 1997')
    expect(page).to have_content('Comedy')
    expect(page).to have_content('Al Bundy is an unsuccessful middle aged shoe salesman with a miserable life and an equally dysfunctional family. ... He hates his job, his wife is lazy, his son is dysfunctional (especially with women), and his daughter is dim-witted and promiscuous.')
  end

  scenario "fail to add a show with invalid information" do

    visit "/television_shows"
    click_link('Add New Show')
    fill_in('Title:', :with => 'Married... with Children')
    fill_in('Network:', :with => 'Fox')
    fill_in('Starting Year:', :with => '1887')
    fill_in('Ending Year:', :with => '1997')
    select("Comedy", :from => "genre")
    fill_in('Synopsis:', :with => 'Al Bundy is an unsuccessful middle aged shoe salesman with a miserable life and an equally dysfunctional family. ... He hates his job, his wife is lazy, his son is dysfunctional (especially with women), and his daughter is dim-witted and promiscuous.')
    click_button('Add TV Show')
    # visit "/television_shows"
    expect(page).to_not have_content('Married... with Children')
  end
end
