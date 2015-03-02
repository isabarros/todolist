class AddPublicToLists < ActiveRecord::Migration
  def change
    add_column :lists, :public, :boolean, default: false
  end
end
