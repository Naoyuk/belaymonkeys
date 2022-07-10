# frozen_string_literal: true

FactoryBot.define do
  factory :chat do
    association :post
    association :host, factory: :user
    association :guest, factory: :user
  end
end
