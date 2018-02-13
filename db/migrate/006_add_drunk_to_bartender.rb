class AddDrunkToBartender<ActiveRecord::Migration[4.2]

  def change;
    add_column :bartenders, :drunk, :integer, :default=>0
  end
end
