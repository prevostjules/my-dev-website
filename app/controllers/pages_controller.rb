class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @contact = Contact.new
    @projects = Project.all
  end
end
