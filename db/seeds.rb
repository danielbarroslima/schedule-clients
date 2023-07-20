# frozen_string_literal: true

Dir[Rails.root.join('db/seeds/*.rb')].each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end

CreateUsersSeed.create_users
