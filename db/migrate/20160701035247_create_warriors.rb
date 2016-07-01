class CreateWarriors < ActiveRecord::Migration
  def change
    create_table :warriors do |t|
      t.string :handle
      t.datetime :created_at
      t.datetime :updated_at
      t.references :nominator, index: true, foreign_key: true
    end
  end
end
