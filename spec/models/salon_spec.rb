require 'rails_helper'

RSpec.describe Salon, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject {
    described_class.new(name: "Sweet Pixie Salon", contact_number: "1111111111",description: "We are popular salon in india" )
  }

  describe "Associations" do
    it "has many" do
      assc = described_class.reflect_on_association(:appointments)
      expect(assc.macro).to eq :has_many
    end

  end

end
