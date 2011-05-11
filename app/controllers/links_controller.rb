class LinksController < ApplicationController
  def index
  end

  def create
    uri = URI::parse(params[:original])
    custom = params[:custom].empty? ? nil : params[:custom]
    unless uri.kind_of? URI::HTTP or uri.kind_of? URI::HTTPS
      flash[:error] = "Invalid URL" 
    else
      @link = Link.shorten(params[:original], custom)
    end
    render :action => "index"
  end
end
