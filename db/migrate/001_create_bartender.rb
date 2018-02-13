class CreateBartender<ActiveRecord::Migration[4.2]

  def change
    create_table :bartenders do |t|
      t.string :name
    end
  end

end
