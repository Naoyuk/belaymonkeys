# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Partnerships', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  scenario 'A user requests a partnership to other users' do
    sign_in_as user
    visit user_path(other_user)
    click_link 'Partner request'
    click_link 'Log out'

    sign_in_as other_user
    visit user_path(other_user)
    expect(page).to have_content 'Partner Request'
    expect(page).to have_content 'Accept'
    expect(page).to have_content 'Delete'
    expect(page).to have_content user.name
  end

  context 'when a user who got a partner request accepts the request' do
    scenario 'now the user and the other user are partners' do
      sign_in_as user
      visit user_path(other_user)
      click_link 'Partner request'
      click_link 'Log out'

      sign_in_as other_user
      visit user_path(other_user)
      click_link 'Accept'
      expect(page).to have_content 'Your partners'
      expect(page).to have_content 'Message'
      expect(page).to have_content 'Remove'
      expect(page).to have_content user.name
    end
  end

  context 'when a user who got a partner request delete the request' do
    scenario 'the request should be deleted and they are not a partner' do
      sign_in_as user
      visit user_path(other_user)
      click_link 'Partner request'
      click_link 'Log out'

      sign_in_as other_user
      visit user_path(other_user)
      click_link 'Delete'
      expect(page).not_to have_content 'Your partners'
      expect(page).not_to have_content 'Message'
      expect(page).not_to have_content 'Remove'
      expect(page).not_to have_content user.name
    end
  end

  scenario 'a user can remove a partner' do
    sign_in_as user
    visit user_path(other_user)
    click_link 'Partner request'
    click_link 'Log out'

    sign_in_as other_user
    visit user_path(other_user)
    click_link 'Accept'
    expect(page).to have_content 'Your partners'
    expect(page).to have_content 'Message'
    expect(page).to have_content 'Remove'
    expect(page).to have_content user.name

    click_link 'Remove'
    expect(page).not_to have_content 'Your partners'
    expect(page).not_to have_content 'Message'
    expect(page).not_to have_content 'Remove'
    expect(page).not_to have_content user.name
  end

  scenario 'partners list shows all partners of a user' do
    sign_in_as user
    visit user_path(other_user)
    click_link 'Partner request'
    click_link 'Log out'

    sign_in_as other_user
    visit user_path(other_user)
    click_link 'Accept'

    visit partners_path
    expect(page).to have_content user.name
    click_link 'Log out'

    sign_in_as user
    visit partners_path
    expect(page).to have_content other_user.name
    click_link 'Log out'

    third_user = FactoryBot.create(:user)
    sign_in_as third_user
    visit user_path(user)
    click_link 'Partner request'
    click_link 'Log out'

    sign_in_as user
    visit user_path(user)
    click_link 'Accept'

    visit partners_path
    expect(page).to have_content other_user.name
    expect(page).to have_content third_user.name
    click_link 'Log out'

    sign_in_as other_user
    visit partners_path
    expect(page).to have_content user.name
    expect(page).not_to have_content third_user.name
    click_link 'Log out'

    sign_in_as third_user
    visit partners_path
    expect(page).to have_content user.name
    expect(page).not_to have_content other_user.name
    click_link 'Log out'
  end
end
