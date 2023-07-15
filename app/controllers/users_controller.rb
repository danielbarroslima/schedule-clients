# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    result = Users::CreateUser.call(user_params.as_json)

    response_result(result)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

  def response_result(result)
    if result.success?
      redirect_to new_user_path
    else
      flash.now[:notice] = result.errors
      render new_user_path
    end
  end
end
