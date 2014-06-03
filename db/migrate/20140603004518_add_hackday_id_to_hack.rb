class AddHackdayIdToHack < ActiveRecord::Migration
  def change
    add_column :hacks, :hackday_id, :integer
  end
end
