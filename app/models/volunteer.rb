class Volunteer < ActiveRecord::Base
  has_many :activities
  belongs_to :user

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:interest].empty?
  end
end
