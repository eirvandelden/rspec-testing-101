class CharacterClass < ApplicationRecord
  has_many :players, class_name: "PlayerCharacter"
end
