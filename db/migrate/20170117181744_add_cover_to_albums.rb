class AddCoverToAlbums < ActiveRecord::Migration[5.0]
  def up
    add_attachment :albums, :cover
  end

  def down
    remove_attachment :albums, :cover
  end
end
