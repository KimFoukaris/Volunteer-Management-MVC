class TasksController < ApplicationController

  get "/tasks" do
    redirect_if_not_logged_in
    @tasks = Task.all
    erb :'tasks/index'
  end

  get "/tasks/new" do
      redirect_if_not_logged_in
      @error_message = params[:error]
      erb :'tasks/new'
    end

    post "/tasks" do
        redirect_if_not_logged_in
        unless Task.valid_params?(params)
          redirect "/tasks/new?error=invalid task"
        end
        Task.create(params)
        redirect "/tasks"
      end

end
