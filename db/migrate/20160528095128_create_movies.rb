class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :location
      t.string :main_image
      t.string :title
      t.string :rating
      t.string :url

      t.timestamps
    end
  end
end
