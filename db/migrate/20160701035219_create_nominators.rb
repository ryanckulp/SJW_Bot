class CreateNominators < ActiveRecord::Migration
  def change
    create_table :nominators do |t|
      t.string :handle
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
