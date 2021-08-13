class WizardsController < ApplicationController

  before_action :set_wizard, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    if params[:query].present?
      @wizards = Wizard.similarity_like(params[:query])
    else
      @wizards = Wizard.all
    end
  end

  def show
    @order = Order.new
  end

  def new
    @wizard = Wizard.new
  end

  def create
    @wizard = Wizard.new(wizard_params)
    @wizard.user = current_user
    if @wizard.save!
      redirect_to wizard_path(@wizard)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @wizard.update(wizard_params)
    redirect_to wizard_path(@wizard)
  end

  def destroy
    @wizard.destroy
    redirect_to wizards_path
  end

  def my_wizards
    @wizards = current_user.wizards
  end


  private

  def set_wizard
    @wizard = Wizard.find(params[:id])
  end

  def wizard_params
    params.require(:wizard).permit(:name, :eye_color, :hair_color, :sex, :house, :price, :picture_url, :description, :species, :photo)
  end
end
