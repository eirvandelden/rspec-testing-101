require 'rails_helper'

# RSpec docs are here: rspec.info
# Most usefull is probably `rspec-expectations` and `rspec-mocks`

# When writing an RSpec test:
# You "describe" the thing you want to test.
# "it" must conform to several behaviours.
RSpec.describe PlayerCharacter, type: :model do
  it "allows Etienne to create a Deekin" do
    deekin = PlayerCharacter.new name: "Deekin Scalesinger"

    expect(deekin.name).to eq "Deekin Scalesinger"
  end
end














# We can "group" tests together using `context`
RSpec.describe PlayerCharacter, type: :model do
  context "when Etienne is playing a character" do
    context "and wants to play comedic relief" do
      it "allows the creation of Deekin" do
        deekin = PlayerCharacter.new name: "Deekin", player: "Etienne"

        expect(deekin.name).to eq "Deekin"
        expect(deekin.player).to eq "Etienne"
      end
    end

    context "and wants to play seriously" do
      it "allows the creation of Lord Ardeth" do
        lord_ardeth = PlayerCharacter.new name: "Lord Ardeth de Tylmarande", player: "Etienne"

        expect(lord_ardeth.name).to eq "Lord Ardeth de Tylmarande"
      end
    end
  end
end













# We can create lazy evaluated objects that get a value when they are used within a test
RSpec.describe PlayerCharacter do
  let(:player) { "Etienne" }
  let(:character_name) { "Rothyrn" }
  subject(:player_character) { described_class.new name: character_name, player: player }

  context "when Etienne is playing a character" do
    context "and wants to play comedic relief" do
      let(:character_name) { "Deekin" }

      it "allows the creation of Deekin" do
        expect(player_character.name).to eq character_name
      end
    end

    context "and wants to play seriously" do
      let(:character_name) { "Lord Ardeth de Tylmarande" }
      subject { player_character.name }

      it { is_expected.to eq character_name }
    end
  end
end
