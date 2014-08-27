class User < ActiveRecord::Base
  has_many :schedules

  validates :name, presence: true
end
