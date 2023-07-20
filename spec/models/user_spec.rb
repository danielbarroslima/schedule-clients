# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  before { user.valid? }

  context 'create or update' do
    let(:user)            { create(:user) }
    let(:user_created)    { User.find_by(email: user.email) }
    let(:user_attributes) { user_created.attribute_names }

    it { expect(user_created.present?).to eq true }
    it { expect(user_attributes).to eq %w[id email name active type_user created_at updated_at] }
  end

  context 'validations' do
    let(:language) { I18n.default_locale == :ja }

    context 'email blank' do
      let(:attr) { language ? 'Eメール' : 'E-mail ' }

      context 'blank' do
        let(:user) { build(:user, email: '') }

        it { expect(user.errors.full_messages.include?("#{attr}#{I18n.t('.errors.messages.blank')}")).to eq true }
      end

      context 'invalid' do
        let(:user) { build(:user, email: Faker::Name.name) }

        it { expect(user.errors.full_messages.include?("#{attr}#{I18n.t('.errors.messages.invalid')}")).to eq true }
      end
    end

    context 'name' do
      let(:attr) { language ? 'Name' : 'Name ' }

      context 'blank' do
        let(:user) { build(:user, name: '') }

        it { expect(user.errors.full_messages.include?("#{attr}#{I18n.t('.errors.messages.blank')}")).to eq true }
      end

      context 'invalid' do
        let(:user) { build(:user, name: 'A') }
        let(:error) { "#{attr}#{I18n.t('.errors.messages.too_short.other', count: 2)}" }

        it { expect(user.errors.full_messages.include?(error)).to eq true }
      end

      context 'too long' do
        let(:user) { build(:user, name: Faker::Name.initials(number: 101)) }
        let(:error) { "#{attr}#{I18n.t('.errors.messages.too_long.other', count: 100)}" }

        it { expect(user.errors.full_messages.include?(error)).to eq true }
      end
    end
  end
end
