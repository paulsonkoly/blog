class CommentsController < ApplicationController
  include ActionView::Helpers::TextHelper
  
  load_and_authorize_resource
  
  def create
    post = Blogpost.find(params[:blogpost_id])
    @comment = post.comments.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.blogpost, notice: 'Your comment was succesfully sent to the server.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @comment.blogpost, alert: comment_error_block(@comment) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :name, :email)
  end

  def comment_error_block(comment)
    output = "<h2>#{pluralize(comment.errors.count, "error")} prohibited this comment from being saved:</h2>\n"
    output << "<ul>\n"
    comment.errors.full_messages.each do |message|
      output << "<li>#{message}</li>\n"
    end       
    output << "</ul>\n"
    output
  end
end
