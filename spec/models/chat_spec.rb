require 'rails_helper'

RSpec.describe Chat, type: :model do
  it 'has a valid factory' do
    chat = FactoryBot.build(:chat)
    expect(chat).to be_valid
  end
end
