class Processor8086
  attr_reader :stack_changed

  attr_reader :so
  attr_reader :psp
  attr_reader :code_segment
  attr_reader :data_segment
  attr_reader :extra_segment
  attr_reader :stack_segment

  attr_reader :cs
  attr_reader :ds
  attr_reader :es
  attr_reader :ss
  attr_reader :sp

  PSP_SIZE = Hex.new(256)
  STACK_ITEM_SITE = Hex.new(2)

  def initialize segments_size
    @so = MemorySegment.new(segments_size[:os])
    @psp = MemorySegment.new(PSP_SIZE)
    @code_segment = MemorySegment.new(segments_size[:code_segment])
    @data_segment = MemorySegment.new(segments_size[:data_segment])
    @extra_segment = MemorySegment.new(segments_size[:extra_segment])
    @stack_segment =  MemorySegment.new(segments_size[:stack_segment])

    load_registers
  end

  def stack_push value
    first_movement unless @stack_changed
    @sp = @sp - STACK_ITEM_SITE
  end

  private
    def load_registers
      @cs = calculate_with_paginate(@so.top_segment + @psp.top_segment)
      @ds = calculate_with_paginate(@so.top_segment)
      @es = calculate_with_paginate(@so.top_segment)
      @ss = calculate_with_paginate(@so.top_segment + @psp.top_segment + @code_segment.top_segment + @data_segment.top_segment + @extra_segment.top_segment)
      @sp = @stack_segment.size

      @stack_changed = false
    end

    def calculate_with_paginate hex
      dec_value = hex.int_value
      paginate_value = (dec_value + (dec_value % 16)) / 16
      Hex.new(paginate_value)
    end

    def first_movement
      @ds = calculate_with_paginate((@cs * 16) + @code_segment.top_segment)
      @es = calculate_with_paginate((@ds * 16) + @data_segment.top_segment)
      @stack_changed = true
    end
end
