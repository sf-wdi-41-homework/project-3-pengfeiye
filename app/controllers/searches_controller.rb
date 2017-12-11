class SearchesController < ApplicationController
  before_action :authentication
  before_action :chatposition

  def create
    
  end
  def show

  end

  private
  def search_params
    params.require(:search).permit(:search)
  end
end
