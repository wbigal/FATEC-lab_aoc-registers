class MemorySegment

  attr_reader :size

  def initialize size
    @size = size
  end

  def top_segment
    @size.paginate_round
  end
end
