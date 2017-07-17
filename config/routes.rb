Rails.application.routes.draw do


  root to: 'sessions#main'

  #ALWAYS HAVE REGISTER ACTIONS COME BEFORE LOGIN
  #-----Register -----------

  get 'main'=> 'sessions#main' # loads the form for login

  post 'main' => "users#create"

  #IMPORTANT!! Since you can logout from anytime you have a user URL of Post URL,
  #YOU NEED THE SLASH in front of logout!!
  post '/logout' =>"sessions#destroy"


  # -----  Login -------------

  post '/login_attempt'=> 'sessions#login_attempt'
  post 'bright_ideas/logout'=> 'sessions#destroy'

  #-------Posts --------------

  get 'bright_ideas'=> 'posts#index' # landing page for login and registration

  get 'posts/:id' => 'posts#show' # when you click, you can see another user's post

  get 'bright_ideas/newIdea' => 'posts#new' #loads form for new idea, located on post index

  post 'create_post' => 'posts#create' #form route to create a post

  get 'bright_ideas/:id/edit' => 'posts#edit' #loads edit post, redirects to update method

  post 'submitPostUpdate' => 'posts#update' #updates post from redirect of edit

  post 'bright_ideas/:id' => 'posts#destroy'

  # get 'users/index'
#-------Like Functions --------------

  get 'bright_ideas' => 'likes#new'

  post 'LikeThisPost' => 'likes#create'



#-------User Functions --------------

  post 'fetchOtherUserProfile' => 'users#fetchOtherUserProfile' # recieves from request to show user, redirects


  get 'users/:id' => 'users#show' # loads the view of a users profile, from the the post rediret from fetchOtherUserProfile


  get 'showCurrentUser/:id' => "users#edit" # loads seperate page to edit the user's account data


  post 'editCurrentUserProfile'=> 'users#update' # post route from form: does what the route says

  get '*path' => redirect('/')
end
