# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/areas', type: :request do
  let(:area) { FactoryBot.create(:area) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get areas_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get area_url(area)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_area_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_area_url(area)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) { FactoryBot.attributes_for(:area) }

      it 'creates a new Area' do
        expect do
          post areas_url, params: { area: valid_attributes }
        end.to change(Area, :count).by(1)
      end

      it 'redirects to the created area' do
        post areas_url, params: { area: valid_attributes }
        expect(response).to redirect_to(area_url(Area.last))
      end
    end
  end

  describe 'PATCH /update' do
    let(:area) { FactoryBot.create(:area) }
    let(:valid_attributes) { FactoryBot.attributes_for(:area) }

    context 'with valid parameters' do
      before do
        @new_attributes = valid_attributes
        @new_attributes[:name] = 'Yosemite'
      end

      it 'updates the requested area' do
        patch area_url(area), params: { area: @new_attributes }
        area.reload
        expect(area.name).to eq 'Yosemite'
      end

      it 'redirects to the area' do
        patch area_url(area), params: { area: @new_attributes }
        area.reload
        expect(response).to redirect_to(area_url(area))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested area' do
      area = FactoryBot.create(:area)
      expect do
        delete area_url(area)
      end.to change(Area, :count).by(-1)
    end

    it 'redirects to the areas list' do
      area = FactoryBot.create(:area)
      delete area_url(area)
      expect(response).to redirect_to(areas_url)
    end
  end
end
