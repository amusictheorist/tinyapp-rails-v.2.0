class UrlsController < ApplicationController
  before_action :set_url, only [:show, :update, :destroy]

  def index
    @urls = Url.all
  end

  def show
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url, notice: 'URL successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @url.update(url_params)
      redirect_to @url, notice: 'URL successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @url.destroy
    redirect_to urls_url, notice: 'URL successfully deleted'
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:short_url, :long_url, :user_id)
  end
end
