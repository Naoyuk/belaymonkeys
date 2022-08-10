# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Partnership, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:partnership)).to be_valid
  end

  describe '#reacted? method' do
    let(:user) { FactoryBot.create(:user) }
    let(:partner) { FactoryBot.create(:user) }

    context 'when user requested a partnership to a another user' do
      it 'returns true' do
        Partnership.create(user_id: user.id, partner_id: partner.id)

        expect(Partnership.reacted?(user.id, partner.id)).to eq true
      end
    end

    context 'when user has not requested a partnership to a another user' do
      it 'returns false' do
        expect(Partnership.reacted?(user.id, partner.id)).to eq false
      end
    end
  end

  describe '#confirmed_record?' do
    let(:user) { FactoryBot.create(:user) }
    let(:partner) { FactoryBot.create(:user) }

    context "user's request has been accepted" do
      it 'returns true' do
        Partnership.create(user_id: user.id, partner_id: partner.id, confirmed: true)

        expect(Partnership.confirmed_record?(user.id, partner.id)).to eq true
      end
    end

    context "user's request has not been accepted" do
      it 'returns false' do
        Partnership.create(user_id: user.id, partner_id: partner.id)

        expect(Partnership.confirmed_record?(user.id, partner.id)).to eq false
      end
    end
  end

  describe '#find_invitation' do
    let(:user) { FactoryBot.create(:user) }
    let(:partner) { FactoryBot.create(:user) }

    it 'returns Partnership id' do
      partnership = Partnership.create(user_id: user.id, partner_id: partner.id, confirmed: true)

      expect(Partnership.find_invitation(user.id, partner.id)).to eq partnership.id
    end
  end
end
