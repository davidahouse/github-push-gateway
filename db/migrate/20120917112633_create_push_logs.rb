class CreatePushLogs < ActiveRecord::Migration
  def change
    create_table :push_logs do |t|
      t.String :data

      t.timestamps
    end
  end
end
