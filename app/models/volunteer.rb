class Volunteer < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:interest].empty?
  end
end
