require 'rails_helper'

# Be cautious with external variables in RSpec tests.
# They can leak into other tests, causing unexpected behavior.
leaky_var = nil

RSpec.describe "external variable leakage" do
  it "sets leaky_var to a value" do
    leaky_var = "I persist!"
    expect(leaky_var).to eq "I persist!"
  end

  it "expects leaky_var to be nil, but it will leak!" do
    expect(leaky_var).to be_nil # This will fail!
  end
end
