class CreateCocktail<ActiveRecord::Migration[4.2]

  def change
    create_table :cocktails do |t|
      t.string :name
      t.integer :bartender_id
    end
  end

end
