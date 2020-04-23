class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,only: [:edit, :update]
	def new
	end

	def create
		@book=Book.new(book_params)
		@book.user_id = current_user.id
  		if @book.save
  			redirect_to book_path(@book.id),notice: "You have creatad book successfully."
  		else
  			@books=Book.all#index用
        	render action: :index
  		end
    end

	def index
		@books=Book.all#全データ表示用
		@book=Book.new
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book=Book.find(params[:id])
	end

	def update
		@book=Book.find(params[:id])#更新は、そのidに上書き処理
  		if @book.update(book_params)
  	    	redirect_to book_path(@book),notice: "You have updated book successfully."
  		else
  			render action: :edit
  		end
	end

	def destroy
		@book = Book.find(params[:id])
	    @book.destroy
	    redirect_to books_path
	end

	def correct_user
        @user_id = Book.find(params[:id]).user_id
        redirect_to books_path unless @user_id == current_user.id
    end

	private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
