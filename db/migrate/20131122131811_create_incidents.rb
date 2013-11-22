class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.belongs_to :quote
      t.date :date
      t.integer :value
      t.string :incidentType
      t.string :desc

      t.timestamps
    end
  end
end
