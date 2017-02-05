class UpdateTaskTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :status, :boolean, default: false
    remove_column :tasks, :completed, :date
    remove_column :tasks, :note, :text
  end
end
