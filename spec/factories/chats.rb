# frozen_string_literal: true

FactoryBot.define do
  factory :chat do
    association :host
    association :guest
    association :post
  end
end
