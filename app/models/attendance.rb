class Attendance < ApplicationRecord
  # after_create :send_attendance

  belongs_to :user
  belongs_to :event

  private

  def send_attendance
    UserMailer.attendance_email(self).deliver_now
  end
end
