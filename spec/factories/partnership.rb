# frozen_string_literal: true

FactoryBot.define do
  factory :partnership do
    association :user
    association :partner
  end
end
