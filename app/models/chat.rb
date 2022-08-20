# frozen_string_literal: true

class Chat < ApplicationRecord
  # Associations
  belongs_to :post, optional: true
  belongs_to :host, class_name: 'User', foreign_key: 'host_user_id', optional: true
  belongs_to :guest, class_name: 'User', foreign_key: 'guest_user_id', optional: true
  has_many :messages

  # Scopes
  scope :own, ->(post_id, host_user_id) { where('post_id = ? and host_user_id = ?', post_id, host_user_id) }

  # サイドバーで選択したパートナーとのDM用Chatを返す
  def self.dm_chat(partner_id: params[:partner_id], id: params[:user_id])
    dm_chat_i_am_host = Chat.where(host_user_id: partner_id, guest_user_id: id, post_id: nil).pluck(:id)
    dm_chat_partner_is_host = Chat.where(host_user_id: id, guest_user_id: partner_id, post_id: nil).pluck(:id)
    ids = dm_chat_i_am_host + dm_chat_partner_is_host
    Chat.where(id: ids)
  end
end
