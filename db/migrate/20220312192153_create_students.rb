class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :registration
      t.boolean :active, null: false, default: true
      t.references :school_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
