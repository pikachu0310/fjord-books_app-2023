# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments/1 or /comments/1.json
  def show; end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments or /comments.json
  def create_comment
    commentable_type = params[:comment][:commentable_type]
    commentable_id = params[:comment][:commentable_id]
    commentable_class = commentable_type.constantize
    commentable = commentable_class.find(commentable_id)
    @comment = commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.commentable, notice: t('comments.created')
    else
      redirect_to request.referer || root_path, alert: t('comments.creation_failed')
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to comment_url(@comment), notice: t('comments.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: t('comments.destroyed')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
