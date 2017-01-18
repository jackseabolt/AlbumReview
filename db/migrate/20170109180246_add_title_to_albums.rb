class AddTitleToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :title, :string
    add_column :albums, :year, :integer
    add_column :albums, :artist, :string
  end
end
