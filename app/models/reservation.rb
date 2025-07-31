class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validates :person, presence: true, numericality: { only_integer: true, greater_than: 0 }

  private

  def end_time_after_start_time
    return if start_time.blank? || end_time.blank?
    if end_time <= start_time
      errors.add(:end_time, "開始日時より後を選択してください")
    end
  end
end
