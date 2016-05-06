require 'spec_helper'

describe Processor8086 do
  let(:segments_size) do
    {
      os: Hex.new(1256),
      code_segment: Hex.new(573),
      data_segment: Hex.new(1808),
      extra_segment: Hex.new(458),
      stack_segment: Hex.new(10)
    }
  end

  subject(:processor) { Processor8086.new(segments_size) }

  context 'load' do
    it '#cs' do
      expect(processor.cs.value).to eq('5F')
    end

    it '#ds' do
      expect(processor.ds.value).to eq('4F')
    end

    it '#es' do
      expect(processor.es.value).to eq('4F')
    end

    it '#ss' do
      expect(processor.ss.value).to eq('110')
    end

    it '#sp' do
      expect(processor.sp.value).to eq('A')
    end

    it '#stack_changed' do
      expect(processor.stack_changed).to be_falsey
    end
  end

  context 'after push' do
    before do
      processor.stack_push ['F', 'F']
    end

    it '#cs' do
      expect(processor.cs.value).to eq('5F')
    end

    it '#ds' do
      expect(processor.ds.value).to eq('83')
    end

    it '#es' do
      expect(processor.es.value).to eq('F4')
    end

    it '#ss' do
      expect(processor.ss.value).to eq('110')
    end

    it '#sp' do
      expect(processor.sp.value).to eq('8')
    end

    it '#stack_changed' do
      expect(processor.stack_changed).to be_truthy
    end
  end
end
