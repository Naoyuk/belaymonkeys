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

  # Mount uploader to Post model
  mount_uploaders :pictures, PictureUploader

  # instance methods
  # def pictures_tile(post)
  #   post.pictures.each do |picture|
  #     image_tag
  #   end
  # end

  # class methods
  def self.looks(area_id)
    @posts = Post.where('area_id = ? and date >= ?', area_id, Date.today)
  end
end
