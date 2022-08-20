# frozen_string_literal: true

class Partnership < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: true
  belongs_to :partner, class_name: 'User', foreign_key: 'partner_id', optional: true

  # 2人のユーザー間にパートナー成立の是非を問わず、招待したレコードがあるかどうかのブール値を返す
  def self.reacted?(id1, id2)
    case1 = !Partnership.where(user_id: id1, partner_id: id2).empty?
    case2 = !Partnership.where(user_id: id2, partner_id: id1).empty?
    case1 || case2
  end

  # 2人のユーザー間に成立されたパートナーシップがあるかどうかのブール値を返す
  def self.confirmed_record?(id1, id2)
    case1 = !Partnership.where(user_id: id1, partner_id: id2, confirmed: true).empty?
    case2 = !Partnership.where(user_id: id2, partner_id: id1, confirmed: true).empty?
    case1 || case2
  end

  # 引数で渡した2人のユーザー間で成立済みのパートナーシップレコードを検索する
  # パートナーシップの解消の時に使う
  def self.find_invitation(id1, id2)
    if Partnership.where(user_id: id1, partner_id: id2).empty?
      Partnership.where(user_id: id2, partner_id: id1)[0].id
    else
      Partnership.where(user_id: id1, partner_id: id2)[0].id
    end
  end

  # パートナーとのDM用チャットを検索し、あれば@messagesを返し、なければ作成する
  def self.find_or_create_messages(user_id, partner_id)
    return unless !user_id.nil? && !partner_id.nil?

    dm_chat = Chat.dm_chat(partner_id:, id: user_id)[0]
    result = {}
    if dm_chat.nil?
      chat = Chat.create(host_user_id: user_id, guest_user_id: partner_id)
      result[:message] = chat.messages.build(user_id:)
    else
      result = { messages: dm_chat.messages, message: dm_chat.messages.build(user_id:) }
    end
    result
  end
end
