class CreatePlayerCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :player_characters do |t|
      t.string :name
      t.string :player
      t.string :distance
      t.integer :ally_id, null: true
      t.integer :health, default: 100
      t.references :character_class, foreign_key: true

      t.timestamps
    end
  end
end
