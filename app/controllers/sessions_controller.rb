class SessionsController < ApplicationController
  def new
    redirect_to scheduler_path unless session[:user_id].blank?
    @user = User.new
  end

  def create
    session[:user_id] =
      User.where(name: params[:user][:name]).first_or_create.id
    redirect_to scheduler_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
