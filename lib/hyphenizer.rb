module IsbnsTools
class Hyphenizer
  require 'function_lib'
  include FunctionLib 

  def initialize(*args)
    @@h_prefixes, @@h_reg_groups = Hash.new, Hash.new
    (args[0].nil?)?  load_xml(@@h_prefixes, @@h_reg_groups, XML_ADDRESS) : (@@h_prefixes, @@h_reg_groups= args[0], args[1])
  end
  def hyphenize(number)
    number =  number.to_s
    number_hyphenized, prefix, five_digits = "",  number[0,3], number[3, 5]
    raise IBSN_INVALID if number.delete("^0-9").length != 13
    load_xml(@@h_prefixes, @@h_reg_groups, XML_ADDRESS) if (@@h_prefixes.count == 0 or @@h_reg_groups.count == 0 ) 
    @@h_prefixes[prefix].nil?? (raise IBSN_INVALID) : (number_hyphenized << (prefix + "-")) 
    first_length = resolve_length(prefix, five_digits, @@h_prefixes).to_i
    number_hyphenized << number[3, first_length] 
    five_digits = number[3+first_length, 5]
    second_length = resolve_length(number_hyphenized, five_digits, @@h_reg_groups).to_i
    number_hyphenized << "-" + number[3+first_length, second_length]
    third_length = 9 - first_length - second_length 
    number_hyphenized << "-" + number[3+first_length+second_length, third_length] + "-" + number[12, 12]
  end

end
end
