require 'rails_helper'

describe Api::V1::PlayDatesController do
  describe 'POST /v1/play_dates' do
    context 'with valid params' do
      let(:pd) { build :play_date }
      let(:dog1) { create :dog }
      let(:dog2) { create :dog }
      let(:valid_params) do
        {
          creator_dog_id: dog1.id,
          invited_dog_id: dog2.id,
          location_id: pd.location_id,
          date: pd.date,
          time: pd.time
        }
      end

      it 'creates the play date' do
        post api_v1_play_dates_path, params: valid_params

        expect(response).to have_http_status 204
        expect(PlayDate.count).to eq(1)
      end
    end

    context 'with invalid params' do
      let(:pd) { build :play_date }
      let(:dog1) { create :dog }
      let(:dog2) { create :dog }
      let(:valid_params) do
        {
          creator_dog_id: dog1.id,
          invited_dog_id: dog2.id,
          location_id: pd.location_id,
          date: pd.date,
          time: pd.time
        }
      end

      it '400s no created dog id' do
        post api_v1_play_dates_path, params: valid_params.merge({ creator_dog_id: '' })

        expect(response.status).to eq(400)
        expect(PlayDate.count).to eq(0)
      end

      it '400s no invited dog id' do
        post api_v1_play_dates_path, params: valid_params.merge({ invited_dog_id: '' })

        expect(response.status).to eq(400)
        expect(PlayDate.count).to eq(0)
      end

      it '400s no location id' do
        post api_v1_play_dates_path, params: valid_params.merge({ location_id: '' })

        expect(response.status).to eq(400)
        expect(PlayDate.count).to eq(0)
      end

      it '400s no date' do
        post api_v1_play_dates_path, params: valid_params.merge({ date: '' })

        expect(response.status).to eq(400)
        expect(PlayDate.count).to eq(0)
      end

      it '400s no time' do
        post api_v1_play_dates_path, params: valid_params.merge({ time: '' })

        expect(response.status).to eq(400)
        expect(PlayDate.count).to eq(0)
      end
    end
  end
end
