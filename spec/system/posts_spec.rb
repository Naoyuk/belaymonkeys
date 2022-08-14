# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end
  # let(:area) { FactoryBot.create(:area) }

  scenario 'user creates a new post' do
    user = FactoryBot.create(:user)

    sign_in_as user

    expect do
      description = 'test post'
      create_post(description)

      expect(page).to have_content 'New post was successfully created.'
      expect(page).to have_content description
    end.to change(user.posts, :count).by(1)
  end

  scenario 'posts before today does not appear on the list' do
    user = FactoryBot.create(:user)

    # Prepair Areas
    FactoryBot.create(:area, name: 'Squamish')
    FactoryBot.create(:area, name: 'Yosemite Valley')

    sign_in_as user

    click_link 'New Post'
    fill_in 'post[date]', with: 2.day.before
    description = 'a post of yesterday'
    fill_in 'post[description]', with: description
    find('#post_area_id').find(:xpath, 'option[2]').select_option
    click_button 'Create Post'

    expect(page).to have_content 'New post was successfully created.'
    expect(page).not_to have_content description
  end

  describe 'posts have a button that shows chat' do
    let(:host) { FactoryBot.create(:host) }
    let(:guest) { FactoryBot.create(:guest) }

    context 'when a post that is own post' do
      scenario 'post shows "See Conversions" button and link to related chats' do
        # Log in as a host
        sign_in_as host

        # A host creates a post
        description = 'own post'
        create_post(description)
        visit root_path

        expect(page).to have_content description
        expect(page).to have_content 'See Conversations'

        # A host see conversations
        first('.message-link').click_link('See Conversations')
        # click_link 'See Conversations'

        expect(page).to have_content 'No messages.'

        # A host log out and a guest log in
        click_link 'Log out'
        sign_in_as guest
        visit root_path

        # a guest send a message
        first('.message-link').click_link('Message')
        # click_link 'Message'
        msg = 'test message from guest'
        fill_in 'message[body]', with: msg
        click_button 'Send Message'
        expect(page).to have_content msg

        # A guest log out and a host log in
        click_link 'Log out'
        sign_in_as host
        visit root_path

        # A host see conversations
        first('.message-link').click_link('See Conversations')
        # click_link 'See Conversations'

        expect(page).to have_content msg
      end
    end

    context 'when a post that is not own' do
      scenario 'shows "Message" button and link to the chat' do
        # Log in as a host
        sign_in_as host

        # A host creates a post
        description = 'other\'s post'
        create_post(description)
        visit root_path

        # A host log out and a guest log in
        click_link 'Log out'
        sign_in_as guest
        visit root_path

        expect(page).to have_content 'Message'

        # a guest send a message
        first('.message-link').click_link('Message')
        # click_link 'Message'

        expect(page).to have_content "Conversation with: #{host.name}"

        msg = 'test message from guest'
        fill_in 'message[body]', with: msg
        click_button 'Send Message'
        expect(page).to have_content msg
      end
    end
  end
end
