# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body { 'test text' }
    read { false }
    association :chat
    association :user
  end
end
