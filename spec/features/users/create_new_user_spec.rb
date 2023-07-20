# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'create new user' do
  scenario 'success' do
    user_email = Faker::Internet.email
    form_new_user(user_email, Faker::Name.name)
    user = User.find_by(email: user_email)

    expect(user.blank?).to eq false
    expect(user.name.blank?).to eq false
    expect(user.disable?).to eq true
    expect(user.active.blank?).to eq true
  end

  scenario 'failure invalid email' do
    user_email = Faker::Name.name
    user_name = Faker::Name.name
    form_new_user(user_email, user_name)
    user = User.find_by(email: user_email)

    expect(user.blank?).to eq true
    expect(page.has_text?('.users.errors.messages.invalid_email'))
  end

  scenario 'failure email in use' do
    user_email = User.create(email: Faker::Internet.email, name: Faker::Name.name, type_user: 0)
    user_name = Faker::Name.name
    form_new_user(user_email, user_name)
    user = User.find_by(email: user_email, name: user_name)

    expect(user.blank?).to eq true
    expect(page.has_text?('.users.errors.messages.email_in_use'))
  end
end

private

# methods for use in tests
def form_new_user(email = '', name = '')
  visit '/users/new'

  within('.form-user') do
    fill_in 'user_email', with: email
    fill_in 'user_name',  with: name
    click_on I18n.t('users.form.submit')
  end
end
