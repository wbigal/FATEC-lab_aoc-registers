require 'spec_helper'

describe MemorySegment do
  let(:size) { Hex.new(573) }
  subject(:memory_segment) { MemorySegment.new(size) }

  it '#size' do
    expect(memory_segment.size).to eq(size)
  end

  it '#top_segment' do
    expect(memory_segment.top_segment).to eq(Hex.new(576))
  end
end
