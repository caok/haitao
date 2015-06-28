class HomeController < ApplicationController
  def index
  end

  def convert
    @link = params[:url]
    respond_to do |format|
      format.js
    end
  end
end
