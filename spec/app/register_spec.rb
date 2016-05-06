require 'spec_helper'

describe Register do

  let(:hex) { Hex.new(1024) }
  subject(:register) { Register.new(hex) }

  it '#value' do
    expect(register.value).to eq(hex)
  end
end
