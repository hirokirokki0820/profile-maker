class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(account_name: session_params[:name].downcase)
    if @user && @user.authenticate(session_params[:password])
      log_in @user
      session_params[:remember_me] == "1" ? remember(@user) : forget(@user)
      flash[:notice] = "ログインしました"
      redirect_to @user
    else
      @user = User.new(session_params)
      flash.now[:error] = "ユーザー名またはパスワードに誤りがあります"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path, status: :see_other
  end

  private
    def session_params
      params.require(:session).permit(:name, :password, :remember_me)
    end
end
