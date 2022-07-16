# frozen_string_literal: true

class Chat < ApplicationRecord
  # Associations
  belongs_to :post
  belongs_to :host, class_name: 'User', foreign_key: 'host_user_id', optional: true
  belongs_to :guest, class_name: 'User', foreign_key: 'guest_user_id', optional: true
  has_many :messages

  # Scopes
  scope :own, ->(post_id, host_user_id) { where('post_id = ? and host_user_id = ?', post_id, host_user_id) }
end
