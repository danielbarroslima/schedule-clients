# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :users, only: %i[index]

      def index
        render json: result_formated, status: :ok
      end

      private

      def users
        @users = User.users_disable(params[:page].to_i)
      end

      def result_formated
        ApplicationHelper.format_result(@users)
      end
    end
  end
end
