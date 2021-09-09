class CreateMuseums < ActiveRecord::Migration[6.0]
  def change
    create_table :museums do |t|
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
