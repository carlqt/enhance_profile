class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :object
      t.string :type

      t.timestamps
    end
  end
end
