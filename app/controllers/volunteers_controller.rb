class VolunteersController < ApplicationController

  get "/volunteers" do
      redirect_if_not_logged_in
      @volunteers = Volunteer.all
      erb :'volunteers/index'
    end

end
