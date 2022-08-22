class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polimorphic: true, null: false, foreign_key: true
      t.text :contents, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
