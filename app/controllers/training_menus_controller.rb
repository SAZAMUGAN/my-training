class TrainingMenusController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :search]
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index, :new, :create, :search]

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
    @menu_records = MenuRecord.where(training_menu_id: params[:id]).order('date DESC')

    weight_records = MenuRecord.where(training_menu_id: params[:id]).order('weight DESC')
    @max_weight = weight_records.first
    @max_weight_reps = weight_records.first
    @max_reps = @menu_records.maximum('reps')

    reps_records = MenuRecord.where(training_menu_id: params[:id]).order('reps DESC')
    @max_reps = reps_records.first
    @max_reps_weight = reps_records.first
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

  def search
    @training_menus = TrainingMenu.search(params[:keyword])
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:name, :explanation, :muscle_category_id, {images: []}).merge(user_id: current_user.id)
  end

  def set_item
    @training_menu = TrainingMenu.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if user_signed_in? && current_user.id != @training_menu.user_id
  end
end
