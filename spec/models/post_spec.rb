# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build(:post) }
  let(:picture_path) { Rails.root.join('spec/fixtures/test1.jpg') }
  let(:picture) { Rack::Test::UploadedFile.new(picture_path) }

  describe 'Validations' do
    it 'has valid factory' do
      expect(post).to be_valid
    end

    it 'is invalid without date' do
      post.date = nil
      post.valid?
      expect(post.errors[:date]).to include("can't be blank")
    end

    it 'is invalid without description' do
      post.description = nil
      post.valid?
      expect(post.errors[:description]).to include("can't be blank")
    end

    it 'can have multiple pictures' do
      post.pictures = [picture, picture]
      expect(post).to be_valid
    end
  end
end
