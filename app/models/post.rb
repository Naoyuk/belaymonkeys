# frozen_string_literal: true

class Post < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :chats

  # Scope
  default_scope -> { order(created_at: :desc) }

  # Validations
  validates :date, presence: true
  validates :description, presence: true

  # Enum
  enum kind_of_climbing: {
    Trad: 0,
    Sport: 1,
    Bouldering: 2,
    MultiPitched: 3
  }
end
