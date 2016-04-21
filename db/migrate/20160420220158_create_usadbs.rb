class CreateUsadbs < ActiveRecord::Migration
  def change
    create_table :usadbs do |t|
    	t.string :base_country
      t.string :base_state_abbr
      t.string :base_state
      t.decimal :base_tip
      t.timestamps null: false
    end
  end
end
