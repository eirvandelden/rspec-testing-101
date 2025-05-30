# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w[Bard Blackguard Assassin].each do |class_name|
  CharacterClass.find_or_create_by!(name: class_name)
end

[
  { name: "Deekin Scalesinger", player: "Etienne", character_class: "Bard" },
  { name: "Rothyrn", player: "Etienne", character_class: "Assassin" },
  { name: "Lord Ardeth de Tylmarande", character_class: "Blackguard", player: "Etienne" } ].each do |character_data|
  PlayerCharacter.find_or_create_by!(name: character_data[:name], player: character_data[:player], character_class: CharacterClass.find_by(name: character_data[:character_class]))
end
