require 'rails_helper'

RSpec.describe Api::V1::FlightsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success without logged in user' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns json array contains flights' do
      get :index
      expect(response.content_type).to eq 'application/json'
    end
  end
end
