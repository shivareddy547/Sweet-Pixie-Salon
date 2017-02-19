require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {
    described_class.new(customer_name: "Test", customer_age: "27",
                        appointment_date: Date.today, time_slot: Time.now.day+2,salon_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a customer_name" do
    subject.customer_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a customer_age" do
    subject.customer_age = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a appointment_date" do
    subject.appointment_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a time_slot" do
    subject.time_slot = nil
    expect(subject).to_not be_valid
  end


  describe "Associations" do
    it "belongs to" do
      assc = described_class.reflect_on_association(:salon)
      expect(assc.macro).to eq :belongs_to
    end

  end

end
