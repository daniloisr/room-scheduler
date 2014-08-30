class Schedule < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :init, presence: true
  validates :finish, presence: true

  validate :valid_time

  def valid_time
    if init < begin_of_week || init > end_of_week
      errors.add(:init, "Deve ser no périodo desta semana")
    elsif finish < begin_of_week || finish > end_of_week
      errors.add(:finish, "Deve ser no périodo desta semana")
    elsif finish < init
      errors.add(:finish, "Deve ser maior que a data de início")
    end
  end

  def end_of_week
    DateTime.now.end_of_week - 2.days
  end

  def begin_of_week
    DateTime.now.beginning_of_week
  end
end
