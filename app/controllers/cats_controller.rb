class CatsController < ApplicationController

  respond_to :html

  def index
    @cats = Cat.paginate page: params[:page], per_page: 30
    athird = (@cats.length/3.0).ceil
    @column1 = @cats[0...athird]
    @column2 = @cats[athird...athird*2]
    @column3 = @cats[athird*2...@cats.length] || []
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.save!
    redirect_to :index
  rescue
    render :new
  end

  def show
    @cat = Cat.find(params[:id])
    @comments = @cat.comments
  end

  def edit
    @cat = Cat.find params[:id]
    redirect_to root_url unless @cat.user == current_user
  end

  def update
    @cat = Cat.find params[:id]
    redirect_to root_url and return unless @cat.user == current_user

    @cat.update_attributes cat_params
    redirect_to :cats
  end

  def destroy
    @cat = Cat.find params[:id]
    redirect_to root_url and return unless @cat.user == current_user
    @cat.destroy
    redirect_to root_url, notice: "You've removed that cat"
  end

  private

  def cat_params
    params[:cat].permit(:image_url, :name, :caption)
  end
end
