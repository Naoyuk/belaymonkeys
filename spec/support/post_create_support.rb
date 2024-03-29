# frozen_string_literal: true

module PostCreateSupport
  def create_post(description, picture = nil)
    FactoryBot.create(:area)
    click_link 'New Post'
    fill_in 'post[date]', with: 1.day.after
    fill_in 'post[description]', with: description
    find('#post_area_id').find(:xpath, 'option[2]').select_option

    attach_file 'Pictures', picture[:picture] unless picture.nil?
    click_button 'Create Post'
  end
end

RSpec.configure do |config|
  config.include PostCreateSupport
end
