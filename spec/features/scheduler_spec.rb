require 'rails_helper'

describe 'Scheduler Screen' do
  scenario "user access scheduler screen" do
    user = create(:user)
    visit new_session_path
    fill_in 'Nome', with: user.name
    click_button 'Login'
    visit scheduler_path
    expect(page).to have_content("Reserva")
    click_link("Disponível")
    expect(page).to have_content("Reservado")
  end
end