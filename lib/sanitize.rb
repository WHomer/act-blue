class Sanitize

  def self.scrub(value, sensitive_fields, key=nil, parent_key=nil)
    if value.class == Hash
      value.inject({}) do |h, (k, v)|
        parent_key = key
        h[k] = scrub(v, sensitive_fields, k, parent_key)
        h
      end
    elsif value.class == Array
      value.map{|v| scrub(v, sensitive_fields, key, parent_key)}
    elsif value.class == String
      return sanitize_string(value) if sanitize_value?(sensitive_fields, key, parent_key)
      value
    elsif value.class == Integer || value.class == Float
      return sanitize_string(value.to_s) if sanitize_value?(sensitive_fields, key, parent_key)
      value
    elsif value.class == TrueClass || value.class == FalseClass
      return "-" if sanitize_value?(sensitive_fields, key, parent_key)
      value
    end
  end

  private

  def self.sanitize_value?(sensitive_fields, key, parent_key)
    sensitive_fields.include?(key.to_s) || sensitive_fields.include?(parent_key)
  end

  def self.sanitize_string(value)
    # replace alphanumeric characters with "*"
    value.gsub(/[A-Za-z\d]/, '*')
  end
end
