class UrlsController < ApplicationController
  include ApplicationHelper

  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by(short_url: params[:short_url])
    if @url.nil?
      redirect_to urls_path, alert: 'URL not found'
    end
  end
  
  def new
    @url = Url.new
  end
  
  def create
    @url = Url.new(url_params)
    @url.short_url = generate_random_string
    @url.user_id = current_user.id
    Rails.logger.debug("URL params: #{@url.inspect}")
    
    if @url.save
      redirect_to @url, notice: 'URL successfully created'
    else
      Rails.logger.error(@url.errors.full_messages.join(", "))
      render :new
    end
  end
  
  def edit
    render 'urls/show'
  end

  def update
    if @url.update(url_params)
      redirect_to @url, notice: 'URL successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @url = Url.find_by(short_url: params[:short_url])

    if @url.nil?
      redirect_to urls_path, alert: 'URL not found'
    elsif @url.user_id != current_user.id
      redirect_to urls_path, alert: 'You are not authorized to delete this URL!'
    else
      @url.destroy
    redirect_to urls_path, notice: 'URL successfully deleted'
    end
  end

  private

  def set_url
    @url = Url.find_by(short_url: params[:short_url])
    unless @url
      redirect_to urls_path, alert: 'URL not found'
    end
  end

  def url_params
    params.require(:url).permit(:short_url, :long_url, :user_id)
  end
end
