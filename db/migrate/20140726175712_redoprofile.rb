class Redoprofile < ActiveRecord::Migration
  def change
    rename_column :profiles, :type, :smedia
  end
end
