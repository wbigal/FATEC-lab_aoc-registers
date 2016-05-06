require 'spec_helper'

describe Hex do
  subject(:hex) { Hex.new(10) }

  it '#value' do
    expect(hex.value).to eq('A')
  end

  it '#int_value' do
    expect(hex.int_value).to eq(10)
  end

  context 'operators with Hex' do
    it '#+' do
      result = hex + Hex.new(1)
      expect(result.value).to eq('B')
    end

    it '#-' do
      result = hex - Hex.new(1)
      expect(result.value).to eq('9')
    end

    it '#*' do
      result = hex * Hex.new(2)
      expect(result.value).to eq('14')
    end
  end

  context 'operators with Fixnum' do
    it '#*' do
      result = hex * 3
      expect(result.value).to eq('1E')
    end
  end
end
