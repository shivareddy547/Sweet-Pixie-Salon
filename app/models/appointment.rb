class Appointment < ApplicationRecord

  # validates :customer_name, presence: true,:uniq=>true

  belongs_to :salon

  validates :customer_age,:customer_name,:appointment_date,:time_slot, presence: true
  validates_uniqueness_of :customer_name
  validates :customer_age, :numericality => { :greater_than_or_equal_to => 0 }



  validate :check_availability?

  def check_availability?
    unless self.appointment_date.nil?
    appointment = Appointment.where(:appointment_date=>self.appointment_date,:time_slot=>self.time_slot)
    if appointment.present? || self.appointment_date < Date.today
    errors.add(:appointment_date, "Slot Not Available")
    end
    end
  end

end
