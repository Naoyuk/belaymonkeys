# frozen_string_literal: true

module PostCreateSupport
  def create_post(description)
    click_link 'New Post'
    fill_in 'post[date]', with: 1.day.before
    fill_in 'post[description]', with: description
    fill_in 'post[area]', with: 'Grandwall'
    click_button 'Create Post'
  end
end

RSpec.configure do |config|
  config.include PostCreateSupport
end
