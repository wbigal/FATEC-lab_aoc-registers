require 'spec_helper'

describe Hex do
  subject(:hex) { Hex.new(11) }

  it '#value' do
    expect(hex.value).to eq('B')
  end

  it '#int_value' do
    expect(hex.int_value).to eq(11)
  end

  it '#paginate_round' do
    expect(hex.paginate_round).to eq(Hex.new(16))
  end

  context 'operators with Hex' do
    it '#+' do
      result = hex + Hex.new(1)
      expect(result.value).to eq('C')
    end

    it '#-' do
      result = hex - Hex.new(1)
      expect(result.value).to eq('A')
    end

    it '#*' do
      result = hex * Hex.new(2)
      expect(result.value).to eq('16')
    end
  end

  context 'operators with Fixnum' do
    it '#*' do
      result = hex * 3
      expect(result.value).to eq('21')
    end
  end
end
