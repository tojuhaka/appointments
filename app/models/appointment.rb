class Appointment < ActiveRecord::Base
  validates_presence_of :title, :start, :end
end
