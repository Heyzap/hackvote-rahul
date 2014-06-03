class AddVotesToHacks < ActiveRecord::Migration
  def change
    add_column :hacks, :votes, :integer
		change_column :table, :column, :integer, :default => 0, :null => false  
  end
end
