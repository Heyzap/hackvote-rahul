class CreateHackdays < ActiveRecord::Migration
  def change
    create_table :hackdays do |t|
      t.string :name

      t.timestamps
    end
  end
end
