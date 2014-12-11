class AddTrackerTokenToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :tracker_token
    end
  end
end
