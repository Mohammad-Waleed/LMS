class LibrariesController < ApplicationController
  before_action :check_sign_in,except:[:index,:show]
  #before_action :find_library,only: [:edit,:update]

  def index
    @libraries=Library.all.order(:id)
  end

  def edit
    @library=Library.find(params[:id])
  end

  def update
    if Library.update(params[:id],parameters)
      redirect_to current_user
    else
      render 'edit'
    end
  end

private

  def find_library
    @library =Library.find(params[:id])
  end

  def check_sign_in
    if !current_user
      redirect_to libraries_path
    end
  end

  def parameters
    params.require(:library).permit(:fine)
  end
end
