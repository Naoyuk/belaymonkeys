require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'user creates a new post' do
    user = FactoryBot.create(:user)

    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect {
      click_link 'New Post'
      fill_in 'post[date]', with: 1.day.before
      fill_in 'post[description]', with: 'test text'
      fill_in 'post[area]', with: 'Grandwall'
      click_button 'Create Post'

      expect(page).to have_content 'New post was successfully created.'
      expect(page).to have_content 'test text'
      expect(page).to have_content "Posted by: #{user.name}"
    }.to change(user.posts, :count).by(1)
  end
end
