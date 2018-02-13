class CreateRecipe<ActiveRecord::Migration[4.2]

  def change
    create_table :recipes do |t|
      t.string :ingredient_id
      t.integer :cocktail_id
    end
  end

end
