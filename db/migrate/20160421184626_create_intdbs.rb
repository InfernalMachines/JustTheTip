class CreateIntdbs < ActiveRecord::Migration
  def change
    create_table :intdbs do |t|
      t.string :country_name
      t.string :curr_name
      t.string :iso

      t.timestamps null: false
    end
  end
end
