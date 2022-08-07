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
    if Partnership.where(user_id: id1, partner_id: id2, confirmed: true).empty?
      Partnership.where(user_id: id2, partner_id: id1, confirmed: true)[0].id
    else
      Partnership.where(user_id: id1, partner_id: id2, confirmed: true)[0].id
    end
  end
end
