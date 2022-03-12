class CreateSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :school_classes do |t|
      t.string :code, null: false

      t.timestamps
    end

    add_index :school_classes, :code, unique: true
  end
end
