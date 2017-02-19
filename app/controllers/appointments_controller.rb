class AppointmentsController < ApplicationController


# List Appointments
  def index
   @appointments = Appointment.where("appointment_date >= ? AND time_slot >= ?",Date.today, Time.now.hour+1).order('appointment_date asc')
  end

  def new
    @new_appointment = Appointment.new
  end

  # Booking Appointment
  def create
    @new_appointment = Appointment.new(appointment_params)
     respond_to do |format|
      if @new_appointment.save
        format.html { redirect_to appointments_path, notice: 'Your Appointment was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  def show


  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @appointment = Appointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:salon_id,:customer_name, :customer_age,:appointment_date,:time_slot)
  end

end
