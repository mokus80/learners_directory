class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :resource_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
