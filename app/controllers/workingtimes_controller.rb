class WorkingtimesController < ApplicationController
  before_action :logged_in_user, only: [:check_in, :check_out, :index]
  before_action :admin_user, only: [:index]

  def check_in
    if Workingtime.can_check_in?(current_user)
      ActiveRecord::Base.transaction do
        # ドロップダウンメニューからのデータを直接取得
        working_place_id = params[:working_place_id]

        # フォームからのデータを元にWorkingTimeインスタンスを作成
        @workingtime = Workingtime.new(
          user_id: current_user.id,
          working_place_id: working_place_id,
          check_in: Time.now
        )

        if @workingtime.save
          flash[:success] = '出勤しました。退勤するにはもう一度ログインが必要です。'
        else
          flash[:danger] = '出勤情報を保存できませんでした。'
        end
      end
    else
      flash[:danger] = 'すでに出勤しています'
    end
    log_out
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
    log_out
    redirect_to root_path
  end

  def index
    @workingtimes = Workingtime.all
  end


  private

  def workingtime_params
    params.require(:workingtime).permit(:check_in, :check_out, :working_place_id, :working_min, :month, :user_id, :working_now)
  end
  def calculate_working_min(workingtimes)
    if workingtimes.check_in.present? && workingtimes.check_out.present?
      working_minutes = ((workingtimes.check_out - workingtimes.check_in) / 60).to_i
      workingtimes.update(working_min: working_minutes)
    end
  end
end
