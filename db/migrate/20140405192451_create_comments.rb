class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :cat, index: true
      t.text :text

      t.timestamps
    end
  end
end
