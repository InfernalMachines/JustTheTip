class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
		t.string :general_service
		t.decimal :service_tip_overide
      t.timestamps null: false
    end
  end
end
