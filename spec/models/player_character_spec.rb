require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
  it "has a name" do
    deekin = PlayerCharacter.new(name: "Deekin Scalesinger")
    expect(deekin.name).to eq "Deekin Scalesinger"
  end
end
