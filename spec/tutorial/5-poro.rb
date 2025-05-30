require 'rails_helper'

# Using Plain-Old Ruby to build your RSpec tests can be a great tool
# Let's cleanup the last spec from 1-minimal_test_spec

RSpec.describe PlayerCharacter do
  let(:player) { "Etienne" }

  context "when Etienne is playing a character" do
    [
      { style: "comedic relief", name: "Deekin Scalesinger" },
      { style: "seriously", name: "Lord Ardeth de Tylmarande" },
      { style: "sneakily", name: "Rothyrn" }
    ].each do |character_for_session|
      context "and wants to play #{character_for_session[:style]}" do
        subject { PlayerCharacter.new(name: character_for_session[:name], player:).name }

        it { is_expected.to eq character_for_session[:name] }
      end
    end
  end
end
