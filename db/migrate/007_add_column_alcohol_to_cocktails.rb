class AddColumnAlcoholToCocktails<ActiveRecord::Migration[4.2]

  def change;
    add_column :cocktails, :alcohol, :string
  end
end
