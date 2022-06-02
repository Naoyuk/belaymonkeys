# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  # Scope
  default_scope -> { order(created_at: :desc) }

  # Validations
  validates :date, presence: true
  validates :description, presence: true
end
