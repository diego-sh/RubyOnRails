class DoctorController < ApplicationController
     # GET /staffs/new
  def new
    @doctor = Doctor.new
  end
  # POST /staffs
  # POST /staffs.json
  def create
    raise   
    @doctor = Doctor.new(doctor_params)
    respond_to do |format|
      if @docotor.save
        format.html { redirect_to @doctor, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @docotor }
      else
        format.html { render :new }
        format.json { render json: @docotor.errors, status: :unprocessable_entity }
      end
    end
  end
end
