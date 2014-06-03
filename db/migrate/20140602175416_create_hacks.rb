class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :title
      t.string :people
			t.integer :votes, :default => 0, :null => false

      t.timestamps
    end
  end
end
