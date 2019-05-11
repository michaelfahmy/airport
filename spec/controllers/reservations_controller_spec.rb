require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  context 'when user logged out' do
    it 'should redirect to login page' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when user logged in' do
    login_user
    it 'should have a current_user' do
      expect(subject.current_user).not_to eq(nil)
    end
  end

  describe 'GET #index' do
    login_user

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @reservations' do
      reservation = create(:reservation, user: subject.current_user)
      get :index
      expect(assigns(:reservations)).to eq([reservation])
    end
  end

  describe 'GET #show' do
    login_user

    context 'when resource is found' do
      it 'returns http success' do
        reservation = create(:reservation, user: subject.current_user)
        get :show, params: { id: reservation.id }
        expect(response).to have_http_status(:success)
      end

      it 'assigns @reservation' do
        reservation = create(:reservation, user: subject.current_user)
        get :show, params: { id: reservation.id }
        expect(assigns(:reservation)).to eq(reservation)
      end
    end

    context 'when resource is not found' do
      it 'returns http not_found' do
        get :show, params: { id: -1 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #create' do
    login_user
    let(:flight) { create(:flight) }

    context 'when resource is valid' do
      def create_request
        post :create, params: { reservation: { flight_id: flight.id, passengers_attributes: [attributes_for(:passenger)] } }
      end

      it 'returns http created' do
        create_request
        expect(response).to have_http_status(:created)
      end

      it 'creates the resource' do
        expect { create_request }.to change(Reservation, :count).by(1)
      end
    end

    context 'when resource is not valid' do
      it 'returns http bad_request' do
        post :create, params: { reservation: { flight_id: flight.id, passengers_attributes: [attributes_for(:passenger, seat: nil)] } }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE #destroy' do
    login_user

    context 'when resource is found' do
      def destroy_request(id)
        delete :destroy, params: { id: id }
      end

      it 'returns http success' do
        reservation = create(:reservation, user: subject.current_user)
        destroy_request(reservation.id)
        expect(response).to have_http_status(:success)
      end

      it 'destroys the resource' do
        reservation = create(:reservation, user: subject.current_user)
        expect { destroy_request(reservation.id) }.to change(Reservation, :count).by(-1)
      end
    end

    context 'when resource is not found' do
      it 'returns http not_found' do
        delete :destroy, params: { id: -1 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
