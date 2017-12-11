class SearchesController < ApplicationController
  before_action :authentication
  before_action :chatposition

  def create
    redirect_to search_result_path(search_params[:search])
  end
  def show
    @search = []
    User.all.each do |user|
      if user.username.include? params[:search]
        @search << user
      end
    end
  end

  private
  def search_params
    params.permit(:search)
  end
end
