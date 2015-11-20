class AddNicknameToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :nickname, :string
  end
end
