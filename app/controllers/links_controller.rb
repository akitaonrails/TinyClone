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

  def show
    link = Link.find(params[:id])
    Visit.delay.register(params[:id], get_remote_ip(request.env))
    redirect_to link.url.original, :status => 301
  end

  def info
    @link = Link.find(params[:id])
    unless @link
      flash[:error] = 'This link is not defined yet'
    else
      @num_of_days = (params[:num_of_days] || 15).to_i
      @count_days_bar = Visit.count_days_bar(params[:id], @num_of_days)
      chart = Visit.count_country_chart(params[:id], params[:map] || 'world')
      @count_country_map = chart[:map]
      @count_country_bar = chart[:bar]
    end
  end

  private

  def get_remote_ip(env)
    if addr = env['HTTP_X_FORWARDED_FOR']
      addr.split(',').first.strip
    else
      env['REMOTE_ADDR']
    end
  end
end
