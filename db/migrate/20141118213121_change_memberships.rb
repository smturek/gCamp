class ChangeMemberships < ActiveRecord::Migration
  def change

    change_table :memberships do |t|
      t.belongs_to :project
    end

  end
end
