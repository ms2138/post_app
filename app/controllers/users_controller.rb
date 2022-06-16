class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def show

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
    redirect_to root_url if @user.nil?
  end
end
