Dir[File.dirname(__FILE__) + "/app/**/*.rb"].each { |file| load file }

segments_size = {
  os: Hex.new(1024),
  code_segment: Hex.new(543),
  data_segment: Hex.new(1048),
  extra_segment: Hex.new(259),
  stack_segment: Hex.new(32)
}

processor = Processor8086.new(segments_size)
puts 'LOAD:'
puts "CS=#{processor.cs} \tDS=#{processor.ds} \t ES=#{processor.es} \t SS=#{processor.ss} \t SP=#{processor.sp}"

processor.stack_push []

puts 'RELOCATED:'
puts "DS=#{processor.ds} \t ES=#{processor.es} \t SP=#{processor.sp}"
