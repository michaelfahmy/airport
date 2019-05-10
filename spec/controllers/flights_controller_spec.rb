require 'rails_helper'

RSpec.describe Api::V1::FlightsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success without logged in user' do
      sign_out subject.current_user if subject.current_user
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @flights' do
      flight = create(:flight)
      get :index
      expect(assigns(:flights)).to eq [flight]
    end
  end
end
