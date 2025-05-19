require 'rails_helper'

# Docs are here: rspec.info
# You "describe" the thing you want to test.
# "it" must conform to several behaviours.
RSpec.describe PlayerCharacter, type: :model do
  it "can create a Deekin" do
    deekin = PlayerCharacter.new(name: "Deekin Scalesinger")
    expect(deekin.name).to eq "Deekin Scalesinger"
  end
end
