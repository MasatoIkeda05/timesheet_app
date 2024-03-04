class TimeSheetsController < ApplicationController
  before_action :logged_in_user, only: [:check_in, :check_out, :index]
  before_action :admin_user, only: [:index]

  def check_in
    if TimeSheet.can_check_in?(current_user)
      ActiveRecord::Base.transaction do

        #TODO:エラーが発生するためストロングパラメータで取得ができていない
        working_place_id = params[:working_place_id]
        @time_sheet = TimeSheet.new(
          user_id: current_user.id,
          working_place_id: working_place_id,
          check_in: Time.now
        )

        if @time_sheet.save
          flash[:success] = '出勤しました。退勤するにはもう一度ログインしてください。'
        else
          flash[:danger] = '勤務地を登録してください'
        end
      end
    else
      flash[:danger] = 'すでに出勤しています'
    end
    log_out
    redirect_to root_path
  end

  def check_out
    @time_sheet = current_user.time_sheets.last
    if @time_sheet && @time_sheet.check_out.nil? && @time_sheet.update(check_out: Time.now)
      calculate_working_min(@time_sheet)
      flash[:success] = '退勤しました。'
    elsif @time_sheet.check_out.present?
      flash[:danger] = 'すでに退勤しています。'
    else
      flash[:danger] = '勤怠情報を取得できませんでした。'
    end
    log_out
    redirect_to root_path
  end

  def index
    if params[:working_place_id].present?
      @time_sheets = TimeSheet.where(working_place_id: params[:working_place_id])
    else 
      @time_sheets = TimeSheet.all
    end
  end

  private

  def workingtime_params
    params.require(:time_sheet).permit(:check_in, :check_out, :working_place_id, :working_min, :month, :user_id, :working_now)
  end

  def calculate_working_min(time_sheets)
    if time_sheets.check_in.present? && time_sheets.check_out.present?
      working_minutes = ((time_sheets.check_out - time_sheets.check_in) / 60).to_i
      time_sheets.update(working_min: working_minutes)

    end
  end
end
