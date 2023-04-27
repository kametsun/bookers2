class BooksController < ApplicationController
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
      #ユーザ画面へリダイレクトしたい
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end

  def index
    #UserId取得したい
    @book = Book.new
    @books = Book.all
  end

  def shows
  end

  def update
    #データを１件取得
    @book = Book.find(params[:id])
    #アップデートする
    if @book.update(book_params)
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path
    else
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

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
