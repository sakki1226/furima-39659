class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,  null: false
      t.string :picture,    null: false
      t.string :price,      null: false
      t.string :postage,    null: false
      t.timestamps
    end
  end
end
