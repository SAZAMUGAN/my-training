class TrainingMenusController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @training_menus = TrainingMenu.all
  end

  def new
    @training_menu = TrainingMenu.new
  end

  def create
    @training_menu = TrainingMenu.new(training_menu_params)
    if @training_menu.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @menu_records = MenuRecord.where(training_menu_id: params[:id])
  end

  def edit
    
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:name, :explanation, :muscle_category_id).merge(user_id: current_user.id)
  end

  def set_item
    @training_menu = TrainingMenu.find(params[:id])
  end
end
