class ManagersController<ApplicationController
  before_action :check_sign_in
  before_action :find_manager,only:[:show,:edit,:destroy,:change_status]

  def index
    @managers = Manager.where(library_id: current_user.library_id).order("created_at ASC")
  end

  def show
    @book=Book.last
    @book_request=BookHistory.where(start_date:nil)
  end

  def new
    @manager=Manager.new
  end

  def create
    fields=manager_params
    fields[:library_id]=current_user.library_id
    @manager=Manager.new(fields)
    if @manager.save
      redirect_to admin_path(current_user.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if Manager.update(manager_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @manager.destroy
    redirect_to managers_path
  end

  def change_status
    if @manager.active?
      @manager.update(status:'inactive')
    else
      @manager.update(status:'active')
    end
    redirect_to managers_path
  end

private

  def manager_params
    params.require(:manager).permit(:email,:status,:image)
  end

  def find_manager
    @manager=Manager.find(params[:id])
  end

  def check_sign_in
    if !current_user
      redirect_to libraries_path
    end
  end
end
