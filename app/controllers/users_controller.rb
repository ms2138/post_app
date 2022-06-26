class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def show
    @pagy, @posts = pagy(@user.posts.order("created_at DESC"))
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to root_url if @user.nil?
  end
end
