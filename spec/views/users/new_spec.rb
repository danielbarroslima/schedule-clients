# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visitor access new page and' do
  scenario 'see instructions' do
    visit '/users/new'

    expect(page).to have_selector('div', class: 'fill-in-the-data', text: I18n.t('.users.form.fill_in_the_data'))
    expect(page).to have_selector('form', class: 'form-user')
    expect(page).to have_field(id: 'user_email', placeholder: I18n.t('.users.form.email_example'), visible: true)
    expect(page).to have_field(id: 'user_name', placeholder: I18n.t('.users.form.first_last_name'), visible: true)
    find_button(I18n.t('.users.form.submit'), name: 'commit', type: 'submit')
  end
end
