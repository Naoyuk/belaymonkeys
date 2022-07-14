require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has valid factory' do
    message = FactoryBot.build(:message)
    expect(message).to be_valid
  end
end
