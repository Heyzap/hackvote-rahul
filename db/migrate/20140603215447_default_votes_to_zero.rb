class DefaultVotesToZero < ActiveRecord::Migration
  def change
		change_column :hacks, :votes, :integer, :default => 0, :null => false  
  end
end
