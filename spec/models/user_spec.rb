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
    context 'invalid email' do
      let(:user) { build(:user, email: Faker::Name.name) }

      it { expect(user.errors.full_messages).to  eq ['Email is invalid'] }
    end

    context 'invalid name' do
      context 'too long' do
        let(:user) { build(:user, name: Faker::Name.initials(number: 101)) }

        it { expect(user.errors.full_messages).to eq ['Name is too long (maximum is 100 characters)'] }
      end

      context 'too short' do
        let(:user) { build(:user, name: Faker::Name.initials(number: 1)) }

        it { expect(user.errors.full_messages).to eq ['Name is too short (minimum is 2 characters)'] }
      end
    end

    context 'email blank' do
      let(:user) { build(:user, email: '') }

      it { expect(user.errors.full_messages).to eq ["Email can't be blank", 'Email is invalid'] }
    end

    context 'name blank' do
      let(:user) { build(:user, name: '') }

      it do
        expect(user.errors.full_messages).to eq ["Name can't be blank", 'Name is too short (minimum is 2 characters)']
      end
    end
  end
end
