class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title,default: ""
      t.text :body,default: ""
      t.integer :user_id

      t.timestamps
    end
  end
end
