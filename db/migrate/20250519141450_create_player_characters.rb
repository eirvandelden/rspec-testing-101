class CreatePlayerCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :player_characters do |t|
      t.string :name
      t.string :player
      t.references :character_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
