class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.timestamps
      t.belongs_to :task
      t.belongs_to :user
    end
  end
end
