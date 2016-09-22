class HomeController<ApplicationController
  def index

  end
#
private
  def sign_up_params
    params.require(:user).permit(:email, :avatar, :password, :password_confirmation)
  end
end
