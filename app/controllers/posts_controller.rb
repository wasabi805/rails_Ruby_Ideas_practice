class PostsController < ApplicationController
  # before_action :check_session # ---check private session schecker



    def index

      @user = User.all
      @post = Post.all
      @likes = Like.all
      current_user = session[:user_id]
      # @loggedInUserId = User.find(session[:user_id]).id
      # @posts= Post.find()
    end

    def show

      @user= User.all
      @like=Like.all
      #To The User Name for the Post
      @postObj = Post.find(params[:id]) #Find the postOBJ associated with the like
      # @posterObj = User.find(params[:user_id]) #params[:user_id] gives us the user object from post table. We use that then for the user query to grab the name
      #Also, the show route has the post id and user id passed through it in the routes and the url to get to this show page
      ######################################

      ####ABSOULUTELY IMPORTANT! - you'll need to have the has many through relationship created  also for Post Model in order to get the user ids who liked  the post
      @liker_ids = @postObj.user_likes.ids
      @liker_names = User.find(@liker_ids)
      @newLikerId = @postObj.user_likes

    end

    def new
      @post = Post.new()
    end


    def create

      # @post = Post.new(post_params).valid? # Need the .valid? for model validations
      @post = Post.new(post_params)
      # if @post.save.valid?
      if @post.save
        flash[:notice] = "Post Submitted!"
        redirect_to ("/bright_ideas")
      else
        flash[:error] = @post.errors.full_messages.to_sentence
        redirect_to ("/bright_ideas")
      end
    end


    def showUser
    end

    def delete
      @post = Post.find(params[:id])
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to('/bright_ideas')
      end


    def update
      @post= Post.find(params[:id]).update_attributes!(post_params)
    end

    private
      #Really IMPORTAN, DON EVER FORGET, USE THIS ALL THE TIME WHEN WHITELISTING!!
      #Used slice to turn the post_params hash to include/ seperate the keys with the has so that you can run the validations and display error messages
      # https://apidock.com/rails/Hash/slice
      def post_params
        params.require(:post).permit(:content,:user_id).slice(:content, :user_id)
      end


      # def check_session
      #
      #   if !session[:user_id]
      #     puts 'brought this guy back to main'
      #     redirect_to ('/main')
      #   else
      #     flash[:notice] = "Successfully created..."
      #   end
      # end

    end
