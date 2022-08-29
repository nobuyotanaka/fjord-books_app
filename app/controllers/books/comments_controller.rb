# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_commentable

  def edit; end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save!
      redirect_to book_path(@commentable), notice: 'Comment was successfully created.'
    else
      @book = @commentable
      render template: 'books/show'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to comment_url(@comment), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:contents)
  end

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
