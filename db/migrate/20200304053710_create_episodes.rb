class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :plot
      t.integer :total_no_of_episode
      t.integer :season_id

      t.timestamps
    end
  end
end
