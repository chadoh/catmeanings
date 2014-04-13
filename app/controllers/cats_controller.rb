class CatsController < ApplicationController

  respond_to :html

  def index
    response.headers["X-Xss-Protection"] = "0"
    @cats = scope_cats_to_user_and_query
    @cats = @cats.paginate page: params[:page], per_page: 30
    @column1 = @cats[0...athird]
    @column2 = @cats[athird...athird*2]
    @column3_1 = @cats[athird*2...athird*5/2] || []
    @column3_2 = @cats[athird*5/2...@cats.length] || []
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    @cat.save!
    redirect_to root_url
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

  def scope_cats_to_user_and_query
    @sharer = User.find params[:user] if params[:user]
    @query = params[:q]

    cats = Cat.all
    cats.where! user_id: @sharer.id if @sharer
    cats = cats.matching @query     if @query
    cats
  end

  def athird
    (@cats.length/3.0).ceil
  end

  def cat_params
    params[:cat].permit(:image_url, :name, :caption)
  end
end
