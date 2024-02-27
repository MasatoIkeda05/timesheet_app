class WorkingtimesController < ApplicationController
  before_action :logged_in_user, only: [:check_in, :check_out]

  def check_in
    if Workingtime.can_check_in?(current_user)
      ActiveRecord::Base.transaction do
        @workingtime = current_user.workingtimes.build
        @workingtime.check_in = Time.now
        if @workingtime.save
          flash[:success] = '出勤しました。'
        else
          flash[:danger] = '出勤情報を保存できませんでした。'
        end
      end
    else
      flash[:danger] = 'すでに出勤しています'
    end
    redirect_to root_path
  end

  def check_out
    @workingtimes = current_user.workingtimes.last
    if @workingtimes && @workingtimes.check_out.nil? && @workingtimes.update(check_out: Time.now)
      calculate_working_min(@workingtimes)
      flash[:success] = '退勤しました。'
    elsif @workingtimes.check_out.present?
      flash[:danger] = 'すでに退勤しています。'
    else
      flash[:danger] = '勤怠情報を取得できませんでした。'
    end
    redirect_to root_path
  end

  private

  def calculate_working_min(workingtimes)
    if workingtimes.check_in.present? && workingtimes.check_out.present?
      working_minutes = ((workingtimes.check_out - workingtimes.check_in) / 60).to_i
      workingtimes.update(working_min: working_minutes)
    end
  end
end
