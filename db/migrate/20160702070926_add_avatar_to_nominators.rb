class AddAvatarToNominators < ActiveRecord::Migration
  def change
    add_column :nominators, :avatar, :text
  end
end
