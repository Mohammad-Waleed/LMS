class IssuersController < ApplicationController
 before_action :check_sign_in
 before_action :find_issuer,only:[:edit,:destroy,:show,:change_status]

  def index
    @issuers = Issuer.where(library_id: current_user.library_id,approval:'approved').order('created_at ASC')
  end

  def show
    if current_user.type=="Admin"
      @history=BookHistory.where(issuer_id: @issuer_id,end_date:[nil,false])
    end
    @issued_books=BookHistory.where(issuer_id:@issuer.id,end_date: nil).where.not(start_date: nil)
    @fine=Library.find(@issuer.library_id).fine
    @books=Book.where(library_id:@issuer.library_id)
  end

  def edit
  end

  def update
    if Issuer.update(params[:id],parameters)
      redirect_to issuers_path
    else
      render 'edit'
    end
  end

  def destroy
    @issuer.destroy
    redirect_to issuers_path
  end

  def change_status
    if @issuer.active?
      @issuer.update(status:'inactive')
    else
      @issuer.update(status:'active')
    end
    redirect_to issuers_path
  end

  def approve
    @issuer=Issuer.find(params[:id])
    if @issuer.unapproved?
      @issuer.update(approval:'approved')
      IssuerMailer.welcome(@issuer).deliver_now!
    end
    redirect_to root_path
  end

private

  def check_sign_in
    if !current_user
      redirect_to libraries_path
    end
  end

  def find_issuer
    @issuer=Issuer.find(params[:id])
  end

  def parameters
    params.require(:issuer).permit(:email,:password,:image,:fname,:lname,:balance,:status)
  end
end
