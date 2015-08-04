require 'spec_helper'

feature 'Starting a new game' do 
	scenario 'I can enter my name' do
		visit '/'
		click_link 'New Game'
		expect(page).to have_content "What's your name?"
    our_name = "Jed"
    fill_in "name", with:"#{our_name}"
    click_button "Submit"
    expect(page).to have_content "Hello #{our_name}"
	end
end