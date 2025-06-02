require 'rails_helper'

# Let's combine it all into a scenario.
# During combat, Deekin is very simple. If one of his allies is at or below 50% health, he will "Heal" that ally. Else, he will Attack an Enemy.

RSpec.describe "Deekins combat strategy" do
  let(:bard) { CharacterClass.find_or_create_by(name: "Bard") }
  let(:deekin) do
    PlayerCharacter.new(
      name: "Deekin Scalesinger",
      player: "Etienne",
      character_class: bard,
      allies: [ ally ]
    )
  end
  let(:ally) { PlayerCharacter.find_or_create_by health: ally_health, distance: ally_distance }

  describe "#next_action" do
    subject { deekin.next_action }

    context "when an Enemy is within reach" do
      context "with an Ally within reach" do
        let(:ally_distance) { "near" }

        context "and that ally is below 50% health" do
          let(:ally_health) { 49 }

          it { is_expected.to eq(:healing_word) }
        end

        context "and that ally is healthy" do
          let(:ally_health) { 100 }

          it { is_expected.to eq(:melee_attack) }
        end
      end

      context "without an Ally within reach" do
        let(:ally_distance) { "far" }

        context "and that ally is below 50% health" do
          let(:ally_health) { 49 }

          it { is_expected.to eq(:move) }
        end

        context "and that ally is healthy" do
          let(:ally_health) { 100 }

          it { is_expected.to eq(:melee_attack) }
        end
      end
    end
  end
end
