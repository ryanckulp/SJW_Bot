class AddVotesToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :votes, :integer
  end
end
