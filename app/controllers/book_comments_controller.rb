class BookCommentsController < ApplicationController
  before_action :book_current_user, only: [:destroy]
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_back fallback_location: root_path
  end
  def destroy
    @book = Book.find(params[:id])
    # comment = @book.book_comment
    book_comment = BookComment.find(params[:id])
    book_comment.destroy
    redirect_back fallback_location: root_path
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

def book_current_user
  @book_comment = BookComment.find(params[:id])
    @user = @book_comment.user
    redirect_to book_path(@book_comment.book_id)  unless @user == current_user
end
end
