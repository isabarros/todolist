# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    sequence(:description) { |n| "Minha tarefa incrível n. #{n}" }
  end
end
