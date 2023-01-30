require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  describe "GET /users.json" do
    context 'when user are present in database' do
      let!(:user) { User.create!(first_name: 'fist', last_name: 'last', user_name: 'user') }
      it "returns all users" do
        get '/users.json'
        expect(response).to have_http_status(200)
        json_response = JSON.parse(response.body)
        expect(json_response.count).to be(1)
        expect(json_response.first["id"]).to be(user.id)
      end
    end

    context 'when no user present in database' do
      it 'return blank array' do
        get '/users.json'
        expect(response).to have_http_status(200)
        json_response = JSON.parse(response.body)
        expect(json_response.count).to be(0)
      end
    end
  end
end
