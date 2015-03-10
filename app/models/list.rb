class List < ActiveRecord::Base
	belongs_to :user
	has_many :tasks, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :watchers, through: :favorites, source: :user

	validates :user_id, presence: true

	scope :public_lists, ->  { where( public: true ) }
end
