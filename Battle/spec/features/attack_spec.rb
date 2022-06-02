# in spec/features/attack_spec.rb

feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content 'Charlotte attacked Mittens'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack!'
    click_button 'OK!'
    expect(page).not_to have_content 'Mittens: 100HP'
    expect(page).to have_content 'Mittens: 90HP'
  end

  scenario 'be attacked by Player 2' do
    sign_in_and_play
    click_button 'Attack!'
    click_button 'OK!'
    click_button 'Attack!'
    expect(page).not_to have_content 'Charlotte attacked Mittens'
    expect(page).to have_content 'Mittens attacked Charlotte'
  end

  scenario 'Player 1 HP reduced by 10' do
    sign_in_and_play
    click_button 'Attack!'
    click_button 'OK!'
    click_button 'Attack!'
    click_button 'OK!'
    expect(page).not_to have_content 'Charlotte: 100HP'
    expect(page).to have_content 'Charlotte: 90HP'
  end
end