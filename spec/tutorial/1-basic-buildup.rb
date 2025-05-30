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
