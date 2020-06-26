class BooksController<ApplicationController
  before_action :check_sign_in
  before_action :book_params,only:[:create]
  before_action :find_book,only:[:change_status,:show,:edit,:update,:destroy]

  def index
    @books = Book.where(library_id: current_user.library_id)
  end

  def new
    @book=Book.new
  end

  def create
    fields=book_params
    fields[:library_id]=current_user.library_id
    @book=Book.new(fields)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to current_user
  end

  def change_status
    if @book.available?
      @book.update(status:'unavailable')
    else
      @book.update(status:'available')
    end
    redirect_to books_path
  end

  def issue_book_request
    @book=Book.find(params[:id])
    if !BookHistory.where(book_id:params[:id],issuer_id:current_user.id,end_date:nil)
      flash[:notice]="You have already requested or issued this book"
      redirect_to current_user
    else
      @history=BookHistory.create(book_id:@book.id,issuer_id:current_user.id)
      if @history.save
        current_user.book_histories << @history
        flash[:notice] = "You have successfully requested for a book!."
        redirect_to current_user
      else
        render 'show'
      end
    end
  end

  def issue_book
    @history=BookHistory.find(params[:id])
    if @history.update(start_date:Time.now.strftime("%d/%m/%Y").to_s)
      @issuer=Issuer.find(@history.issuer_id)
      @issuer.book_histories << @history
      flash[:notice] = "You have successfully issued book!."
      redirect_to current_user
    else
      render 'show'
    end
  end

  def return_book
    @book=Book.find(params[:id])
    @history=BookHistory.where(book_id:params[:id],issuer_id:current_user.id)
    if @history.update(end_date:Time.now.strftime("%m/%d/%Y").to_s)
      flash[:notice] = "You have successfully returned book!."
      redirect_to current_user
    else
      render 'show'
    end
  end

private

  def check_sign_in
    if !current_user
      redirect_to libraries_path
    end
  end

  def find_book
    @book=Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title,:isbn,:status,:author,:year,:genre,:no_of_copies,images:[])
  end
end
