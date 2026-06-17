class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
      @user = current_user
    if params[:user][:remove_avatar] == "1"
      @user.avatar.purge
      redirect_to user_path(@user), notice: "Photo supprimée !"
      return
    end
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to user_path(@user), notice: "Profil mis à jour !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :remove_avatar, :password, :password_confirmation, :current_password)
  end
end
