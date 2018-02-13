class CreateIngredient<ActiveRecord::Migration[4.2]

  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :cocktail_id
    end
  end

end
