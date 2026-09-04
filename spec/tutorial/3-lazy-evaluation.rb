require 'rails_helper'

# We can create lazy evaluated objects that get a value when they are used within a test
RSpec.describe PlayerCharacter do
  subject(:valid_character) { described_class.new name: character_name, player: player }

  let(:player) { "Etienne" }
  let(:character_name) { "Rothyrn" }



  context "when Etienne is playing a character" do
    context "and wants to play comedic relief" do
      let(:character_name) { "Deekin" }

      it "allows the creation of Deekin" do
        expect(valid_character.name).to eq character_name
      end
    end

    context "and wants to play seriously" do
      subject { valid_character.name }

      let(:character_name) { "Lord Ardeth de Tylmarande" }



      it { is_expected.to eq character_name }
    end
  end
end
