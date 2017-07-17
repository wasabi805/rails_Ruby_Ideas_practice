class SessionsController < ApplicationController
  # before_action :create
  #  skip_before_action :check_session, except: [:destroy, :session_params]

  def index
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
      redirect_to bright_ideas_url, success: "You've successfully logged in!"
    else
      flash[:error] = "Invalid email or password" # form validation
      redirect_to main_path, danger: "Invalid email or password = ( "
    end
  end

  def like

  end


  def create
  end


  def destroy

    reset_session
    if current_user = nil
      redirect_to ("/main")
    else
      redirect_to ("/main")
    end
  end






  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

  # def logout_params
  #   params.require(:session).permit(:user_id)
  # end
