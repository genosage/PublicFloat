class AddIbeaconuuidToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :ibeaconuuid, :text
  end
end
