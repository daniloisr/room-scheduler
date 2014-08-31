class SchedulersController < ApplicationController
  before_filter :check_login
  def show
  end

  def create
    year = Schedule.new.beginning_of_week.year
    month = (Schedule.new.beginning_of_week + (params[:wday].to_i - 1).day).month
    day = (Schedule.new.beginning_of_week + (params[:wday].to_i - 1).day).day
    hour = params[:hour].to_i

    init = DateTime.new(year, month, day, hour)

    Schedule.create(user: current_user, init: init)

    respond_to do |format|
      format.html { redirect_to :show, notice: 'created' }
      format.json { render json: { message: "Reservado por #{current_user.name}" } }
    end
  end
end
