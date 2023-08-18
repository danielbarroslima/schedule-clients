# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visitor view all users' do
  let(:users) { create_list(:user, 40, type_user: :disable) }
  let(:response_body) { JSON.parse(response.body) }

  context 'index' do
    context 'without params' do
      before do
        users
        get '/api/v1/users'
        response_body
      end
      it { expect(response.status).to eq 200 }
      it { expect(response_body['records'].count).to eq 25 }
      it { expect(response_body['records'].uniq.count).to eq 25 }
      it { expect(response_body['records'].find { |u| u['id']&.positive? }).to eq nil }
      it { expect(response_body['records'].find { |u| u['email']&.nil? }).to eq nil }
      it { expect(response_body['records'].count).to eq 25 }
      it { expect(response_body.dig('meta', 'prev')).to eq nil }
      it { expect(response_body.dig('meta', 'page')).to eq 1 }
      it { expect(response_body.dig('meta', 'next')).to eq 2 }
      it { expect(response_body.dig('meta', 'total')).to eq 40 }
    end

    context 'with params' do
      before do
        users
        get '/api/v1/users', params: { page: 2 }
        response_body
      end
      it { expect(response.status).to eq 200 }
      it { expect(response_body['records'].count).to eq 15 }
      it { expect(response_body['records'].uniq.count).to eq 15 }
      it { expect(response_body['records'].find { |u| u['id']&.positive? }).to eq nil }
      it { expect(response_body['records'].find { |u| u['email']&.nil? }).to eq nil }
      it { expect(response_body['records'].count).to eq 15 }
      it { expect(response_body.dig('meta', 'prev')).to eq 1 }
      it { expect(response_body.dig('meta', 'page')).to eq 2 }
      it { expect(response_body.dig('meta', 'next')).to eq nil }
      it { expect(response_body.dig('meta', 'total')).to eq 40 }
    end

    context 'with params' do
      before do
        users
        get '/api/v1/users', params: { page: 3 }
        response_body
      end
      it { expect(response.status).to eq 200 }
      it { expect(response_body['records'].count).to eq 0 }
      it { expect(response_body.dig('meta', 'prev')).to eq 2 }
      it { expect(response_body.dig('meta', 'page')).to eq 3 }
      it { expect(response_body.dig('meta', 'next')).to eq nil }
      it { expect(response_body.dig('meta', 'total')).to eq 40 }
    end
  end
end
