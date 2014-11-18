class ChangeRoles < ActiveRecord::Migration
  def change

    change_table :roles do |t|
      t.remove :owner
      t.rename :member, :role
    end

  end
end
