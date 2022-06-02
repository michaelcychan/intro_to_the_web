# in spec/features/switch_turns_spec.rb

feature 'Switching turns' do
  scenario "Player 1's turn in the beginning" do
    sign_in_and_play
    expect(page).to have_content "Charlotte's turn"
  end

  scenario "After Player 1 attacks, it changes to Player 2's turn" do
    sign_in_and_play
    click_button "Attack!"
    click_button "OK!"
    expect(page).not_to have_content 'Player turn: Charlotte'
    expect(page).to have_content "Mittens's turn"
  end
end