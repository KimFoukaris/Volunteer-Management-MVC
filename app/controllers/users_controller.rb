class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/volunteers'
    end
  end

  post '/signup' do
      if params[:username] == "" || params[:password] == ""
        redirect to '/signup?error=username or password empty'
      elsif User.exists?(username: params[:username])
        redirect to '/signup?error=invalid duplicate username'
      else
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect '/volunteers'
      end
    end

    get '/login' do
        if !session[:user_id]
          erb :'users/login'
        else
          redirect '/volunteers'
        end
      end

      post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect "/volunteers"
        else
          redirect to '/signup'
        end
      end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
