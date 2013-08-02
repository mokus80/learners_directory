class ChangeColumn < ActiveRecord::Migration
	def up
		change_column :resources, :summary, :text
	end

	def down
		change_column :resources, :summary, :string
	end
end
