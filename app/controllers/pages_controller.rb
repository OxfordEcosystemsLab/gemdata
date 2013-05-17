class PagesController < ApplicationController

  def show
    params[:pagename] ||= "welcome"
    render "pages/#{params[:pagename]}"
  end

end
