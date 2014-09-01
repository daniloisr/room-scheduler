require 'rails_helper'

describe 'Scheduler Screen' do
  let(:user) { create(:user) }

  scenario "user can make a schedule", js: true do
    login(user)

    visit scheduler_path
    expect(page).to have_content("Reserva")

    expect { Schedule.count
      find('.wday-1.hour-6').click_link("Disponível")
     }.to change{ Schedule.count }.by(1)

    expect(page).to have_content("Reservado por #{user.name}")
  end

  scenario "user can cancel a schedule", js: true do
    schedule = create(:schedule, user: user)
    login(user)
  end

  scenario "shows schedules of another user" do
    schedule = create(:schedule, user: create(:user))
    login(user)

    expect(page).to have_content("Reservado por #{schedule.user.name}")
  end

  def login(user)
    visit new_user_session_path
    fill_in 'Login', with: user.login
    fill_in 'Senha', with: 'password'
    click_button 'Acessar'
  end
end