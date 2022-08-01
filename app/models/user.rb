# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :posts, dependent: :nullify
  has_many :partnerships

  # ユーザーのすべてのパートナーを配列で返す
  def partners
    partners_i_sent_invitation = Partnership.where(user_id: id, confirmed: true).pluck(:partner_id)
    partners_i_got_invitation = Partnership.where(partner_id: id, confirmed: true).pluck(:user_id)
    ids = partners_i_sent_invitation + partners_i_got_invitation
    User.where(id: ids)
  end

  # 引数で渡したユーザーとパートナーであるかのブール値を返す
  def partner_with?(user)
    Partnership.confirmed_record?(id, user.id)
  end

  # 引数で渡したユーザーに対してパートナーシップの招待状を送る
  def send_invitation(user)
    partnerships.create(partner_id: user)
  end
end
