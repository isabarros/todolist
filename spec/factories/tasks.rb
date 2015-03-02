# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
  	list
    sequence(:description) { |n| "Minha tarefa incrível n. #{n}" }
  end
end
