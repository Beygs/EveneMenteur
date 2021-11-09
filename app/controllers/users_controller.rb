class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]
  before_action :verify_identity, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    user = params[:user]

    if @user.update_attributes(
      first_name: user[:first_name],
      last_name: user[:last_name],
      description: user[:description]
    )
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  private

  def verify_identity
    unless current_user == User.find(params[:id])
      redirect_to root_path
    end
  end
end
