class LoginController < ApplicationController
    before_action :create
  def main
    @user=User.all
  end



  def login_attempt #post -create session
    @user = User.new()

    if session_params[:email].present? && session_params[:password].present?
      @current_user = User.where(:email => session_params[:email]).first

      if @current_user
        @current_user = @current_user.authenticate(session_params[:password])
        # @current_user.authenticate(session_params[:password])
      end
    end

      if @current_user
        session[:user_id]= @current_user.id
        flash[:notice]="Login success"
        redirect_to ("bright_ideas")
      else
      # flash.now[:error] = "incorrect email and or password" # this one will at least get you the error
        flash.now[:error] = "invalid email and/ or password"
        redirect_to ("main")
      end
    end


  def create
  end





  def destroy
    reset_session
    @current_user = nil
    redirect_to "main"
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
