class TimeSheet < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :working_place
  validates :working_place_id, presence: true

  def self.check_in(user, working_place_id)
    create(user: user, working_place_id: working_place_id, check_in: Time.now)
  end

  def self.can_check_in?(user)
    last_time_sheet = user.time_sheets.order(created_at: :desc).first

    # 直前の勤怠レコードが存在し、かつ退勤していない場合にのみ出勤できる
    last_time_sheet.nil? || last_time_sheet.check_out.present?
  end

end
