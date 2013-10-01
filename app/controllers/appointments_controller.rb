class AppointmentsController < ApplicationController
  def index
    render json: Appointment.all
  end

  def show
    render json: Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    logger.info params

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

end
