class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :list, index: true
      t.string :description
      t.timestamps
    end
  end
end
