# frozen_string_literal: true

# generate data for initialize
class BaseSeed
  def environment_permited?
    environment
  end

  private

  def environment
    ENV['RAILS_ENV'] ||= ENV['RACK_ENV'] || 'development'
    ENV['RAILS_ENV'] == 'development'
  end
end
