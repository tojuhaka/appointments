require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  setup do
    @appointment_defaults = {
      title: 'Massage',
      description: 'legs and shoulders',
      start: DateTime.parse('Mon, 25 Jun 2012 12:30:00 +0200'),
      end: DateTime.parse('Mon, 25 Jun 2011 14:30:00 +0200')
    }
  end

  test "should be invalid if required data missing" do
    appointment = Appointment.new
    assert !appointment.valid?
    [:title, :start, :end].each do |field_name|
      assert appointment.errors.keys.include? field_name
    end
  end


  test "should not require description" do
    @appointment_defaults[:description] = ""
    appointment = Appointment.new(@appointment_defaults)
    assert appointment.valid?
  end



  test "should be valid if required data exists" do
    appointment = Appointment.new(@appointment_defaults)
    assert appointment.valid?
  end

  # test "the truth" do
  #   assert true
  # end
end
