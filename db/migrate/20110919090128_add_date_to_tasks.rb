class AddDateToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :date, :date
  end

  def self.down
    remove_column :tasks, :date
  end
end
