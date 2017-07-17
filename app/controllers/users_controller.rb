class UsersController < ApplicationController
  # skip_before_action :check_session, except: [:new, :show, :edit, :create ]
  # before_action :check_session, except: [:create]# ---check private session schecker
  def index

  end

  def new
    @user = User.new()

    redirect_to ('create')
  end

  def show
    @user =User.find(params[:id])


  end

  def edit
    @user = User.find(params[:id])
    render 'edit'
  end


  def create

    @user = User.new user_params

    if @user.save
      session[:user_id] = User.last.id
      current_user = session[:user_id]
      flash[:success] = "Successfully registered"
      redirect_to("/bright_ideas") # DO NOT RENDER ON A POST!!
    else
      binding.pry
      @user.errors.full_messages
      flash.now[:error] = "Name Can not be blank"
      redirect_to main_path, danger: "wha wha wha"
    end
  end






# Oringinal create BELOW --- !!!!!!!!DO NOT DELETE THIS BLOCK!!!!!!! -------
  # def create
  #   @user = User.new user_params
  #   if @user.save
  #     flash[:success] = "Successfully registered"
  #     redirect_to("/bright_ideas") # DO NOT RENDER ON A POST!!
  #   else
  #     flash.now[:errors] = @user.errors.full_messages
  #     redirect_to('/main') # DO NOT RENDER ON A POST!!
  #   end
  # end

  private

    def user_params
      params.require(:user).permit(:name, :alias, :email, :password).slice(:name,:alias,:email, :password)
    end


end
