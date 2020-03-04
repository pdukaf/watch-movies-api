class CreateVideoContents < ActiveRecord::Migration[6.0]
  def change
    create_table :video_contents do |t|
      t.string :title
      t.integer :plot
      t.integer :number
      t.string :type

      t.timestamps
    end
  end
end
