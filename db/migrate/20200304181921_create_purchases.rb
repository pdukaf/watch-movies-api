class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.decimal :price, precision: 3, scale: 2, default: 2.99
      t.string :video_quality
      t.references :video_content, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
