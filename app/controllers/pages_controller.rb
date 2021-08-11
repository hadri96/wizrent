class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @wizards = Wizard.all.limit(6)
  end
end
