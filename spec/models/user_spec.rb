# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has valid factory' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  let(:user) { FactoryBot.create(:user) }
  let(:partner1) { FactoryBot.create(:user) }
  let(:partner2) { FactoryBot.create(:user) }
  let(:partner3) { FactoryBot.create(:user) }

  describe '#partners method' do
    it 'returns all partner as array' do
      Partnership.create(user_id: user.id, partner_id: partner1.id, confirmed: true)
      Partnership.create(user_id: user.id, partner_id: partner2.id, confirmed: true)

      expect(user.partners).to eq [partner1, partner2]
    end
  end

  describe '#partner_with? method' do
    it 'returns true if user has a partnership with other user' do
      Partnership.create(user_id: user.id, partner_id: partner1.id, confirmed: true)
      
      expect(user.partner_with?(partner1)).to eq true
    end
  end

  describe '#send_invitation method' do
    it 'creates a partnership record' do
      expect {
        user.send_invitation(partner1)
      }.to change(Partnership, :count).by(1)
    end
  end
end
