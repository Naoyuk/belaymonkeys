# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Area, type: :model do
  it 'has a valid factory' do
    area = FactoryBot.build(:area)
    expect(area).to be_valid
  end

  it 'is invalid without name' do
    area = FactoryBot.build(:area, name: nil)
    area.valid?
    expect(area.errors[:name]).to include("can't be blank")
  end
end
