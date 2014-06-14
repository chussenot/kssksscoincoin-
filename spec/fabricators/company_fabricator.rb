# encoding: utf-8

Fabricator(:company) do
  name { sequence(:account_name) { |i| "#{Faker::Company.name} {i}" } }
end


