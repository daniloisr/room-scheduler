require 'rails_helper'

describe 'Scheduler Screen' do
  scenario "user access scheduler screen", js: true do
    user = create(:user)
    login(user)

    visit scheduler_path
    expect(page).to have_content("Reserva")

    expect { Schedule.count
      find('.wday-1 .hour-6').click_link("Disponível")
     }.to change{ Schedule.count }.by(1)

    expect(page).to have_content("Reservado por #{user.name}")
  end

  scenario "shows schedules of another user" do
    schedule = create(:schedule, user: create(:user))
    login(create(:user))

    expect(page).to have_content("Reservado por #{schedule.user.name}")
  end

  def login(user)
    visit new_session_path
    fill_in 'Nome', with: user.name
    click_button 'Login'
  end
end