class SchedulersController < ApplicationController
  before_filter :check_login
  def show
  end

  def create
    schedule = ScheduleBuilder.build(current_user, params[:wday], params[:hour])

    if schedule.save
      respond_to do |format|
        format.html { redirect_to :show, notice: 'created' }
        format.json { render json: { message: "Reservado por #{current_user.name}" } }
      end
    else
      raise NotImplementedError
    end
  end

  def destroy
  end
end
