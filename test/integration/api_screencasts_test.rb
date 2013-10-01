require 'test_helper'

class ApiAppointmentsTest < ActionDispatch::IntegrationTest

  test "get /api/appointments.json" do
    get "/api/appointments.json"
    assert_response :success
    assert body == Appointment.all.to_json
    appointments = JSON.parse(response.body)
    assert appointments.size == 2
    assert appointments.any? { |s| s["title"] == "Massage" }
  end

  test "get /api/appointments/:id" do
    appointment = appointments(:one)
    get "/api/appointments/#{appointment.id}.json"
    assert_response :success
    assert body == appointment.to_json
    assert JSON.parse(response.body)["title"] == appointment.title
  end
end
