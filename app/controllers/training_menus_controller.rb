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

  def update
    if @training_menu.update(training_menu_params)
      redirect_to training_menu_path(@training_menu.id)
    else
      render :edit
    end
  end

  def destroy
    @training_menu.destroy
    redirect_to root_path
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:name, :explanation, :muscle_category_id).merge(user_id: current_user.id)
  end

  def set_item
    @training_menu = TrainingMenu.find(params[:id])
  end
end
