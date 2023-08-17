# frozen_string_literal: true

require_relative 'base_seed'

# 'create users in base'
class CreateUsersSeed
  def self.create_users
    return unless BaseSeed.new.environment_permited?

    User.destroy_all
    users = users_list
    User.create(users)
  end

  def self.users_list
    users = []
    12.times.each do
      users << {
        email: Faker::Internet.email,
        name: Faker::Name.name,
        active: [true, false].sample,
        type_user: [0, 5, 9, 16].sample
      }
    end

    users
  end
end
