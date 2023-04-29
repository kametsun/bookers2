class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def index
    @user = User.find(current_user.id)
    #newはワンちゃんいらない=>createで定義すればよい？
    @book = Book.new
    @books = Book.all
  end

  #使わない
  def new
    @book = Book.new
  end


  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    #データをDBに保存するためのsaveメソッド実行
    if @book.save
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully created."
      #booksの詳細画面へリダイレクトしたい
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end



  def show
    @user = User.find(@book_detail.user_id)
    @book = Book.new
    @book_detail = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    #データを１件取得
    @book = Book.find(params[:id])
    #アップデートする
    if @book.update(book_params)
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash[:danger] = "失敗"
      render :edit
    end
  end

  def destroy
    #データを１件取得
    book = Book.find(params[:id])
    #データを削除
    if book.destroy
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end

  # 投稿データのストロングパラメータ
  private

    def is_matching_login_user
      book = Book.find(params[:id])
      unless book.user_id == current_user.id
        redirect_to books_path
      end
    end


  def book_params
    params.require(:book).permit(:title, :body)
  end

end
