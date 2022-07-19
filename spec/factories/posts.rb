# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Date.new.strftime('%Y-%m-%d') }
    start_time { Time.new.strftime('%H:%M') }
    end_time { Time.new.strftime('%H:%M') }
    kind_of_climbing { :bouldering }
    sequence(:description) { |n| "test test#{n}" }
    association :user
    association :area
  end
end
