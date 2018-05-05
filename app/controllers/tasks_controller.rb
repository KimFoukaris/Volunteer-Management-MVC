require 'rack-flash'

class TasksController < ApplicationController

  use Rack::Flash
  enable :sessions

  get "/tasks" do
    redirect_if_not_logged_in
    @tasks = Task.all
    erb :'tasks/index'
  end

  get "/tasks/new" do
    redirect_if_not_logged_in
    erb :'tasks/new'
  end

  post "/tasks" do
    redirect_if_not_logged_in
    unless Task.valid_params?(params)
      flash[:message] = "Error:  Name and Description must have content"
      redirect "/tasks/new?error=invalid task"
    end
    Task.create(params)
    redirect "/tasks"
  end

  get "/tasks/:id/edit" do
    redirect_if_not_logged_in
    @task = Task.find(params[:id])
    erb :'tasks/edit'
  end

  post "/tasks/:id" do
    redirect_if_not_logged_in
    @task = Task.find(params[:id])
    unless Task.valid_params?(params)
      flash[:message] = "Error:  Name and Description must have content"
      redirect "/tasks/#{@task.id}/edit?error=invalid task"
    end
    @task.update(params.select{|k|k=="name" || k=="description" || k=="volunteer_id"})
    redirect "/tasks/#{@task.id}"
  end

  get "/tasks/:id" do
    redirect_if_not_logged_in
    @task = Task.find(params[:id])
    erb :'tasks/show'
  end

  delete '/tasks/:id/delete' do
    redirect_if_not_logged_in
    @task = Task.find(params[:id])
    if @task && @task.volunteer.user_id == current_user.id
      @task.delete
      redirect to '/tasks'
    else
      flash[:message] = "Error:  Invalid User"
      redirect "/tasks?error=invalid user"
    end
  end

end
