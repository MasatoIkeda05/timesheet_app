class WorkingtimesController < ApplicationController
  before_action :logged_in_user, only: [:check_in, :check_out]

  def check_in
    @workingtimes = current_user.workingtimes.build(check_in: Time.now)
    if @workingtimes.save
      flash[:success] = '出勤しました。'
    else
      flash[:danger] = '出勤情報を保存できませんでした。'
    end
  end

  def check_out
    @workingtimes = current_user.workingtimes.last
    if @workingtimes&& @workingtimes.update(check_out: Time.now)
      calculate_working_min(@workingtimes)
      flash[:success] = '退勤しました。'
    else
      flash[:danger] = '退勤情報を保存できませんでした。'
    end
  end

  private

  def calculate_working_min(workingtimes)
    if workingtimes.check_in.present? && workingtimes.check_out.present?
      working_minutes = ((workingtimes.check_out - workingtimes.check_in) / 60).to_i
      workingtimes.update(working_min: working_minutes)
    end
  end
end