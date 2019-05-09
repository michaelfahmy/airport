require 'rails_helper'

RSpec.describe Api::FlightsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'respond with json array contains flights' do
      get :index
      expect(response.content_type).to eq 'application/json'
    end
  end
end
