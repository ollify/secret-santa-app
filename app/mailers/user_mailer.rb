class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail(to: @user.email, subject: 'Welcome to soholymoly')
  end

  def approval_confirmation
      @user = params[:user]

      mail(
        to:       @user.email,
        subject:  "#{@user.first_name}, your request has been approved!"
      )
  end

  def draw_confirmation
      @user = params[:user]

      mail(
        to:       @user.email,
        subject:  "#{@user.first_name}, your secret santa..."
      )
  end
end
