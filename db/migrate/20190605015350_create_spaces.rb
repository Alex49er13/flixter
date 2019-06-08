class CreateSpaces < ActiveRecord::Migration[5.2]
 def change
    create_table :spaces do |t|
      t.string :title
      t.integer :course_id
      t.timestamps
    end
    add_index :spaces, :course_id
  end
end