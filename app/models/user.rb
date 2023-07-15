# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i }

  enum type_user: { disable: 0, normal_user: 5, admin_user: 9, enable: 16 }
end
