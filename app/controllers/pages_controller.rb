class PagesController < ApplicationController

  def show
    params[:pagename] ||= "homepage"
    render "pages/#{params[:pagename]}"
  end

end
