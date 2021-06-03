class AddAcceptedToJots < ActiveRecord::Migration[6.1]
  def change
    add_column :jots, :accepted, :boolean, default: false
  end
end
