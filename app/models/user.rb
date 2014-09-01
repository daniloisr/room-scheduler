class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable

  has_many :schedules

  validates :name, presence: true
  validates :login, presence: true
  validates_presence_of :password, :on => :create
end
