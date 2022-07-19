# frozen_string_literal: true

class Post < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :area
  has_many :chats

  # Scope
  default_scope -> { order(created_at: :desc) }

  # Validations
  validates :date, presence: true
  validates :description, presence: true

  # Enum
  enum kind_of_climbing: %i[trad sport bouldering multipitches]
end
