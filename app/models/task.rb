class Task < ActiveRecord::Base
  belongs_to :volunteer

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:description].empty?
  end
end
