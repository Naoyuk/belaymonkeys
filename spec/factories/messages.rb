# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body { 'test mesage' }
    read { false }
    association :user
    association :chat
  end
end
