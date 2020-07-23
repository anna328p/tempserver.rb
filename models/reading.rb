class Reading < ActiveRecord::Base
  validates_presence_of :sensor_id, :temperature
end
