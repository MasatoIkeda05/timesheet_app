class WorkingPlacesController < ApplicationController
  before_action :admin_user, only: [:new, :create]

  def new
    @working_place = WorkingPlace.new
  end

  def create
    @working_place = WorkingPlace.new(working_place_params)
    if @working_place.save
      flash[:success] = "新しい勤務地を登録しました"
    else
      flash[:danger] = "勤務を登録できませんできた"
    end
    redirect_to new_working_place_path
  end

  private

  def working_place_params
    params.require(:working_place).permit(:place, :wage)
  end
end
