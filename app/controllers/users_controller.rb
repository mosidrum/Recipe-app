class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end


  def show
    if params[:id] == 'sign_out' # Cambié '=' por '=='
      sign_out_redirect_to
    else
      find_user
    end
  end

  def find_user
    @user = User.find_by(id: params[:id]) # Corregí el formato de los parámetros
    redirect_to user_path, alert: 'User not found' unless @user # Corregí la ruta y el formato del 'unless'
  end

  def sign_out_redirect_to
    sign_out current_user
    redirect_to new_user_session_path
  end
end
