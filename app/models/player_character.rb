class PlayerCharacter < ApplicationRecord
  # Party
  has_many :allies, class_name: "PlayerCharacter", foreign_key: "ally_id"
  belongs_to :ally, class_name: "PlayerCharacter", optional: true

  belongs_to :character_class

  def next_action
    return :healing_word if allies.map(&:distance).include?("near") && allies.map(&:health).any? { |h| h < 50 }
    return :move if allies.map(&:distance).include?("far") && allies.map(&:health).any? { |h| h < 50 }

    :melee_attack
  end
end
