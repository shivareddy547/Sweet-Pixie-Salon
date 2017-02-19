require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do


  describe "GET index" do
    it "assigns @appointments" do
      team = Appointment.create(customer_name: 'Test', customer_age: 27, appointment_date: Date.today, time_slot: Time.now.day+2, salon_id: 1)
      get :index
      expect(assigns(:appointments)).to eq([team])
    end
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

  describe "responds to" do
    it "responds to html by default" do
      post :create, { :appointment => { customer_name: 'Test', customer_age: 27, appointment_date: Date.today, time_slot: Time.now.day+2, salon_id: 1 } }
      expect(response.content_type).to eq "text/html"
    end

  end

end
