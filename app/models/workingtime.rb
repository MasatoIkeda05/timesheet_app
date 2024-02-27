class Workingtime < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  def self.can_check_in?(user)
    last_workingtime = user.workingtimes.order(created_at: :desc).first

    # 直前の勤怠レコードが存在し、かつ退勤していない場合にのみ出勤できる
    last_workingtime.nil? || last_workingtime.check_out.present?
  end
end
