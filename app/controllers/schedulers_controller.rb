class SchedulersController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def create
    schedule = ScheduleBuilder.build(current_user, params[:wday], params[:hour])

    if schedule.save
      respond_to do |format|
        format.html { redirect_to :show, notice: 'Reserva criada com sucesso' }
        format.json { render json: { message: "Reservado por #{current_user.name}" } }
      end
    else
      # TODO: tratar quando já existir uma reservar neste horário
      raise NotImplementedError
    end
  end

  # TODO: remover um agendamento
  def destroy
  end
end
