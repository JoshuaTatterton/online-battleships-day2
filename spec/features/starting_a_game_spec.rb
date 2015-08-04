require 'spec_helper'
require 'battleships'

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
	scenario 'I am given a default name if i do not enter one' do
	  visit '/'
    click_link 'New Game'
    click_button "Submit"
    expect(page).to have_content "Hello Player1" 		
	end
  scenario 'can play against computer' do
    visit '/'
    click_link 'New Game'
    click_button "Submit"
    click_link 'VS Computer'
    expect(page).to have_content "Please select where to fire."
  end
end

feature 'Playing a game' do
  scenario 'can see the board' do
    game = Game.new Player, Board
    board = game.opponent_board_view game.player_1
    visit '/'
    click_link 'New Game'
    click_button "Submit"
    click_link 'VS Computer'
    expect(page).to have_content board
  end
end