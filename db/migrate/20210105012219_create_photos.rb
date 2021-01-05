class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :path
      t.text :state

      t.timestamps
    end
  end
end
