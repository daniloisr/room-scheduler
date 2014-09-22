class SchedulersController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def create
    schedule = ScheduleBuilder.build(current_user, params[:wday], params[:hour])

    respond_to do |format|
      if schedule.save
        format.html { redirect_to :show, notice: 'Reserva criada com sucesso' }
        format.json { render json: { message: "Reservado por #{current_user.name}" } }
      else
        format.html { redirect_to :show, notice: 'Não foi possível criar a reserva' }
        format.json { render json: { message: "Não foi possível realizer a reserva, confira os erros: '#{schedule.errors.full_message}'", status: 400 } }
      end
    end
  end

  # TODO: remover um agendamento
  def destroy
    Schedule.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to :show, notice: 'Reserva removida com sucesso' }
      format.json { render json: { newElement: "<span>Oi</span>" } }
    end
  end
end
