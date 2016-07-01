class CreateNominees < ActiveRecord::Migration
  def change
    create_table :nominees do |t|
      t.string :handle
      t.integer :votes
      t.datetime :created_at
      t.datetime :updated_at
      t.references :nominator, index: true, foreign_key: true
      t.boolean :warrior_status, default: false
    end
  end
end
