class AddResourceIdToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :resource_id, :integer
  end
end
