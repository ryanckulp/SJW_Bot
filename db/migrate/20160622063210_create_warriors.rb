class CreateWarriors < ActiveRecord::Migration
  def change
    create_table :warriors do |t|
      t.string :handle
    end
  end
end
