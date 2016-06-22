class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.string :nominee_handle
      t.string :nominator_handle
      t.timestamps null: false
    end
  end
end
