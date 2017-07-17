
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  # bootstrap keys for flash messages
  add_flash_types :danger, :info, :warning, :success


  # NOTICE: (see view/application/error_messages.html.erb)


  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end


  def user_is_logged_in # check to see
    if session[:user_id] = nil || current_user =nil
      redirect_to ("main_path")
    end
  end

  def correct_user?(user)
    user == current_user
  end




  helper_method :current_user
  helper_method :user_is_logged_in



  def check_session

    if !session[:user_id]
      puts 'Please sign in'
      redirect_to ('/main')
    else
      flash[:notice] = "Successfully created..."
    end
  end


end
