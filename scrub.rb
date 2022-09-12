require 'json'
require './lib/sanitize'

sensitive_fields_text = "sensitive_fields.txt"
sensitive_fields_text = ARGV[0] if ARGV[0]
input_json = "input.json"
input_json = ARGV[1] if ARGV[1]

sensitive_fields = File.open(sensitive_fields_text).readlines.map(&:chomp)
input = JSON.parse(File.read(input_json))

json_output = Sanitize.scrub(input, sensitive_fields)

File.write("./output.json", JSON.pretty_generate(json_output))
puts "======================="
puts JSON.pretty_generate(json_output)
puts "======================="