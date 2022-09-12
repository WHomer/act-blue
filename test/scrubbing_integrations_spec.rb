require 'minitest/autorun'
require './lib/sanitize'
require 'json'

class ScrubbingTest < Minitest::Test

  def test_it_can_handle_basic
    sensitive_fields = File.open("./test/examples/00_basic/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/00_basic/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/00_basic/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_alphanumeric
    sensitive_fields = File.open("./test/examples/01_alphanumeric/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/01_alphanumeric/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/01_alphanumeric/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_array
    sensitive_fields = File.open("./test/examples/02_array/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/02_array/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/02_array/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_booleans
    sensitive_fields = File.open("./test/examples/03_booleans/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/03_booleans/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/03_booleans/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_numbers
    sensitive_fields = File.open("./test/examples/04_numbers/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/04_numbers/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/04_numbers/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_floats
    sensitive_fields = File.open("./test/examples/05_floats/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/05_floats/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/05_floats/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_nested_object
    sensitive_fields = File.open("./test/examples/06_nested_object/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/06_nested_object/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/06_nested_object/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)
    assert_equal expected_result, json_output
  end

  def test_it_can_handle_mixed_type_arrays
    sensitive_fields = File.open("./test/examples/07_mixed_type_arrays/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/07_mixed_type_arrays/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/07_mixed_type_arrays/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_sensitive_nested_objects
    sensitive_fields = File.open("./test/examples/08_sensitive_nested_objects/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/08_sensitive_nested_objects/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/08_sensitive_nested_objects/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, json_output
  end

  def test_it_can_handle_nested_arrays
    sensitive_fields = File.open("./test/examples/09_senstive_nested_arrays/sensitive_fields.txt").readlines.map(&:chomp)
    input = JSON.parse(File.read("./test/examples/09_senstive_nested_arrays/input.json"))
    expected_result = JSON.parse(File.read("./test/examples/09_senstive_nested_arrays/output.json"))

    json_output = Sanitize.scrub(input, sensitive_fields)
    assert_equal expected_result, json_output
  end

end