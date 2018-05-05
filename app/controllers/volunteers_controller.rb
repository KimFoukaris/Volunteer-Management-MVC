class VolunteersController < ApplicationController

  get "/volunteers" do
      redirect_if_not_logged_in
      @volunteers = Volunteer.all
      erb :'volunteers/index'
    end

  get "/volunteers/new" do
      redirect_if_not_logged_in
      #@error_message = params[:error]
      erb :'volunteers/new'
    end

  post "/volunteers" do
    redirect_if_not_logged_in
    unless Volunteer.valid_params?(params)
      redirect "/volunteers/new?error=invalid volunteer"
    end
    current_user.volunteers.create(params)
    redirect "/volunteers"
  end

  get "/volunteers/:id/edit" do
      redirect_if_not_logged_in
      #@error_message = params[:error]
      @volunteer = Volunteer.find(params[:id])
      if @volunteer && @volunteer.user == current_user
        erb :'volunteers/edit'
      else
        redirect "/volunteers?error=invalid user"
      end
    end

  post "/volunteers/:id" do
    redirect_if_not_logged_in
    @volunteer = Volunteer.find(params[:id])
    unless Volunteer.valid_params?(params)
      redirect "/volunteers/#{@volunteer.id}/edit?error=invalid volunteer"
    end
    @volunteer.update(params.select{|k|k=="name" || k=="interest"})
    redirect "/volunteers/#{@volunteer.id}"
  end

  get "/volunteers/:id" do
      redirect_if_not_logged_in
      @volunteer = Volunteer.find(params[:id])
      erb :'volunteers/show'
    end

  delete '/volunteers/:id/delete' do
    redirect_if_not_logged_in
    @volunteer = Volunteer.find(params[:id])
    if @volunteer && @volunteer.user == current_user
      @volunteer.delete
      redirect to '/volunteers'
    else
      redirect "/volunteers?error=invalid user"
    end
  end

end
