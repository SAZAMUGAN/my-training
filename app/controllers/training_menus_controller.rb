class TrainingMenusController < ApplicationController
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
  private

  def training_menu_params
    params.require(:training_menu).permit(:name, :explanation, :muscle_category_id).merge(user_id: current_user.id)
  end

end
