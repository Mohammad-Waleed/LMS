class IssuerMailer < ApplicationMailer
  def welcome
    mail(to: params[:issuer].email)
  end
end
