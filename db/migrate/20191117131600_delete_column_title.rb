class DeleteColumnTitle < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :title
  end
end
