class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.integer :quarter
      t.boolean :passed
      t.integer :grade

      t.timestamps
    end
  end
end
