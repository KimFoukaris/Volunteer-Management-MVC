class VolunteersController < ApplicationController

  get "/volunteers" do
      redirect_if_not_logged_in
      @volunteers = Volunteer.all
      erb :'volunteers/index'
    end

    get "/volunteers/new" do
        redirect_if_not_logged_in
        @error_message = params[:error]
        erb :'volunteers/new'
      end

end
