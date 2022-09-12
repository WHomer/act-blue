require 'minitest/autorun'
require './lib/sanitize'

class SanitizeTest < Minitest::Test

  def test_it_can_handle_hash
    input = {"name": "John Smith", "id": 1234}
    sensitive_fields = ["name"]
    expected_result = {"name": "**** *****", "id": 1234}
    result = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, result

    input = {"name": "John Smith", "id": 1234}
    sensitive_fields = []
    expected_result = {"name": "John Smith", "id": 1234}
    result = Sanitize.scrub(input, sensitive_fields)

    assert_equal expected_result, result
  end

  def test_it_can_handle_string
    input = "John Smith"
    sensitive_fields = ["name"]
    expected_result = "**** *****"
    result = Sanitize.scrub(input, sensitive_fields, "name")

    assert_equal expected_result, result

    input = "John Smith"
    sensitive_fields = ["id"]
    expected_result = "John Smith"
    result = Sanitize.scrub(input, sensitive_fields, "name")

    assert_equal expected_result, result
  end

  def test_it_can_handle_number
    input = 1234
    sensitive_fields = ["id"]
    expected_result = "****"
    result = Sanitize.scrub(input, sensitive_fields, "id")

    assert_equal expected_result, result

    input = 12.34
    sensitive_fields = ["id"]
    expected_result = "**.**"
    result = Sanitize.scrub(input, sensitive_fields, "id")

    assert_equal expected_result, result

    input = 1234
    sensitive_fields = []
    expected_result = 1234
    result = Sanitize.scrub(input, sensitive_fields, "id")

    assert_equal expected_result, result
  end

  def test_it_can_handle_boolean
    input = true
    sensitive_fields = ["active"]
    expected_result = "-"
    result = Sanitize.scrub(input, sensitive_fields, "active")

    assert_equal expected_result, result

    input = false
    sensitive_fields = ["active"]
    expected_result = "-"
    result = Sanitize.scrub(input, sensitive_fields, "active")

    assert_equal expected_result, result

    input = true
    sensitive_fields = []
    expected_result = true
    result = Sanitize.scrub(input, sensitive_fields, "active")

    assert_equal expected_result, result

    input = false
    sensitive_fields = []
    expected_result = false
    result = Sanitize.scrub(input, sensitive_fields, "active")

    assert_equal expected_result, result
  end

  def test_it_can_handle_array
    input = [1234, "1234", 82.3]
    sensitive_fields = ["id"]
    expected_result = ["****", "****", "**.*"]
    result = Sanitize.scrub(input, sensitive_fields, "id")

    assert_equal expected_result, result

    input = [1234, "1234", 82.3]
    sensitive_fields = []
    expected_result = [1234, "1234", 82.3]
    result = Sanitize.scrub(input, sensitive_fields, "id")

    assert_equal expected_result, result
  end

  def test_it_can_handle_nested_hashes
    input = {"first": "John", "last": "Smith", "id": 1234}
    sensitive_fields = ["name"]
    expected_result = {"first": "****", "last": "*****", "id": "****"}
    result = Sanitize.scrub(input, sensitive_fields, "name")

    assert_equal expected_result, result

    input = {"first": "John", "last": "Smith", "id": 1234}
    sensitive_fields = []
    expected_result = {"first": "John", "last": "Smith", "id": 1234}
    result = Sanitize.scrub(input, sensitive_fields, "name")

    assert_equal expected_result, result
  end

end