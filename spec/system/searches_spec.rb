# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }

  it 'narrow down posts by selected area' do
    # Prepair Areas
    FactoryBot.create(:area, name: 'Squamish')
    FactoryBot.create(:area, name: 'Yosemite Valley')

    # Log in
    sign_in_as user

    # A host creates some posts
    click_link 'New Post'
    fill_in 'post[date]', with: 1.day.before
    fill_in 'post[description]', with: 'post of Squamish1'
    find('#post_area_id').find(:xpath, 'option[2]').select_option
    click_button 'Create Post'

    click_link 'New Post'
    fill_in 'post[date]', with: 2.day.before
    fill_in 'post[description]', with: 'post of Yosemite Valley'
    find('#post_area_id').find(:xpath, 'option[3]').select_option
    click_button 'Create Post'

    click_link 'New Post'
    fill_in 'post[date]', with: 3.day.before
    fill_in 'post[description]', with: 'post of Squamish2'
    find('#post_area_id').find(:xpath, 'option[2]').select_option
    click_button 'Create Post'

    visit root_path
    find('#area_id').find(:xpath, 'option[1]').select_option
    click_button 'Search'

    expect(page).to have_content 'post of Squamish1'
    expect(page).to have_content 'post of Squamish2'

    visit root_path
    find('#area_id').find(:xpath, 'option[2]').select_option
    click_button 'Search'

    expect(page).to have_content 'post of Yosemite Valley'
  end
end
