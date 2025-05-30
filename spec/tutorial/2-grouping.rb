require 'rails_helper'

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
