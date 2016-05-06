class Hex
  attr_reader :decimal
  attr_reader :hexa_val

  def initialize decimal
    @decimal = decimal
    @hexa_val = decimal.to_s(16).upcase
  end

  def value
    @hexa_val
  end

  def int_value
    @decimal
  end

  def +(hex)
    Hex.new(self.decimal + hex.int_value)
  end

  def -(hex)
    Hex.new(self.decimal - hex.int_value)
  end

  def *(value)
    if (value.kind_of?(Hex))
      Hex.new(self.decimal * value.int_value)
    else
      Hex.new(self.decimal * value)
    end
  end

  def to_s
    @hexa_val
  end
end
