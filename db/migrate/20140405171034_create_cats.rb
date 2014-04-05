class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :image_url
      t.string :name
      t.string :caption

      t.timestamps
    end
  end
end
