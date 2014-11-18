class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :role_id
      t.timestamps
    end

    create_table :roles do |t|
      t.string :member
      t.string :owner
      t.timestamps
    end
    
  end
end
