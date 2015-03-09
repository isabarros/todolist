class List < ActiveRecord::Base
	belongs_to :user
	has_many :tasks, dependent: :destroy

	validates :user_id, presence: true

	scope :public_lists, ->  { where( public: true ) }
end
