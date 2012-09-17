class ChangeDataToText < ActiveRecord::Migration
  def up
  	change_column :push_logs, :data, :text
  end

  def down
  	change_column :push_logs, :data, :string
  end
end
