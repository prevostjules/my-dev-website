class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :presentation ]

  def home
    @contact = Contact.new
    @projects = Project.all
  end

  def presentation
  end
end
