class AdminsController<ApplicationController
  before_action :check_sign_in

  def show
    @managers=Manager.all.order("created_at")
    @issuers=Issuer.where(approval: :approved)
    @issuers_request=Issuer.where(approval: :unapproved)
  end

private

  def check_sign_in
    if !current_user
      redirect_to libraries_path
    end
  end
end
