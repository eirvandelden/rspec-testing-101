require 'rails_helper'

# We can create lazy evaluated objects that get a value when they are used within a test
RSpec.describe PlayerCharacter do
  let(:player) { "Etienne" }
  let(:character_name) { "Rothyrn" }
  subject(:valid_character) { described_class.new name: character_name, player: player }

  context "when Etienne is playing a character" do
    context "and wants to play comedic relief" do
      let(:character_name) { "Deekin" }

      it "allows the creation of Deekin" do
        expect(valid_character.name).to eq character_name
      end
    end

    context "and wants to play seriously" do
      let(:character_name) { "Lord Ardeth de Tylmarande" }
      subject { player_character.name }

      it { is_expected.to eq character_name }
    end
  end
end
