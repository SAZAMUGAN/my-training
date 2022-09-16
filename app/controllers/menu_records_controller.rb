class MenuRecordsController < ApplicationController
  before_action :set_training_menu, only: [:new, :show]
  before_action :set_menu_record, only: [:show]
  def new
    @menu_record = MenuRecord.new
  end

  def create
    @menu_record = MenuRecord.new(menu_record_params)
    if @menu_record.save
      redirect_to training_menu_path(@training_menu.id)
    else
      render :new
    end
  end

  def show

  end

  private

  def set_training_menu
    @training_menu = TrainingMenu.find(params[:training_menu_id])
  end

  def set_menu_record
    @menu_record = MenuRecord.find(params[:id])
  end

  def menu_record_params
    @training_menu = TrainingMenu.find(params[:training_menu_id])
    params.require(:menu_record).permit(:date, :form_level_id, :weight, :reps, :circuit_menus, :memo).merge(
      user_id: current_user.id, training_menu_id: @training_menu.id
    )
  end
end
