class CreateSalons < ActiveRecord::Migration[5.0]
  def change
    create_table :salons do |t|
      t.string :name
      t.string :contact_number
      t.text :description

      t.timestamps
    end
  end
end
