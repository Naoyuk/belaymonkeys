# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UploadPhotos', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }

  scenario 'User can upload a picture when creates a new post' do
    sign_in_as user

    description = 'upload photo test'
    picture = Rails.root.join('spec/fixtures/test1.jpg').to_s
    create_post(description, picture:)

    expect(page).to have_selector("img[src$='test1.jpg']")
  end

  scenario 'User can upload multiple pictures when creates a new post' do
    sign_in_as user

    description = 'upload photo test'
    picture1 = Rails.root.join('spec/fixtures/test1.jpg').to_s
    picture2 = Rails.root.join('spec/fixtures/test2.jpg').to_s
    pictures = [picture1, picture2]
    create_post(description, picture: pictures)

    expect(page).to have_selector("img[src$='test1.jpg']")
    expect(page).to have_selector("img[src$='test2.jpg']")
  end
end
