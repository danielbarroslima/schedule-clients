# frozen_string_literal: true

# require 'rails-i18n'
module Users
  # Create users in system as disable
  class CreateUser < ApplicationInteractor
    requires :email, :name

    def call
      raise I18n.t('users.errors.messages.email_in_use') if email_in_use?
      raise I18n.t('users.errors.messages.invalid_email') if invalid_email?

      context.user = create_user
    rescue StandardError => e
      context.fail!(message: e.message)
    end

    private

    def invalid_email?
      email_regex_valid = /\A([\w+-]\.?)+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i
      valid = context.email =~ email_regex_valid
      valid.is_a?(NilClass)
    end

    def email_in_use?
      user = User.find_by(email: context.email.downcase)
      user.present?
    end

    def create_password
      return context.password if context.password.present?

      (Digest::MD5.hexdigest "#{SecureRandom.hex(10)}-#{DateTime.now}")
    end

    def create_user
      User.create(email: context.email.downcase, name: context.name.downcase)
    end
  end
end
