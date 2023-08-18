# frozen_string_literal: true

class User < ApplicationRecord
  validates :name,  presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i }

  enum type_user: { disable: 0, banned_user: 5, admin_user: 9, enable: 16 }

  LIMIT_DATA = 25

  scope(:users_disable, lambda do |page = 0|
    where(type_user: :disable).select('DISTINCT email')
                              .order('email ASC')
                              .page(page)
                              .per(LIMIT_DATA)
  end)
end
