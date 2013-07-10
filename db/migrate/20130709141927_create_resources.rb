class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :summary
      t.string :link

      t.timestamps
    end
  end
end
