class CommentsController < ApplicationController

  respond_to :js

  def create
    comment = Comment.new comment_params
    comment.user = current_user
    comment.cat = Cat.find params[:comment][:cat_id]
    comment.save!
    @comments = comment.cat.comments
  end

  def edit
    @comment = Comment.find params[:id]
    @cat = @comment.cat
  end

  def update
    comment = Comment.find params[:id]
    head(:unauthorized) and return if current_user != comment.user

    comment.update_attributes comment_params
    @comments = comment.cat.comments
  end

  def destroy
    comment = Comment.find params[:id]
    head(:unauthorized) and return if current_user != comment.user

    comment.destroy
    @comments = comment.cat.comments
  end

  private

  def comment_params
    params[:comment].permit(:text)
  end
end
