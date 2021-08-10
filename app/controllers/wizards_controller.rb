class WizardsController < ApplicationController

  before_action :set_wizard, only [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    @wizards = Wizard.all
  end

  def show
  end

  def new
    @wizard = Wizard.new
  end

  def create
    @wizard = Wizard.new(wizard_params)
    if @wizard.save
      redirect_to wizards_path
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

  private

  def set_wizard
    @wizard = Wizard.find(params[:id])
  end

  def wizard_params
    params.require(:wizard).permit(:name, :eye_color, :hair_color, :sex, :house, :price, :picture_url, :description, :user_id, :species)
  end
end
