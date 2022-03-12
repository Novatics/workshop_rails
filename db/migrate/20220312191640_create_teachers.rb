class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :expertise
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
