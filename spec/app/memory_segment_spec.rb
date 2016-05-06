require 'spec_helper'

describe MemorySegment do
  let(:size) { Hex.new(573) }
  subject(:memory_segment) { MemorySegment.new(size) }

  it '#size' do
    expect(memory_segment.size).to eq(size)
  end
end
