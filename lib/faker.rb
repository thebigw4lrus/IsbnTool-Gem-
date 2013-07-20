module IsbnsTools
class Faker
  require 'function_lib'
  require 'hyphenizer'
  
  include FunctionLib 
  
  
  def initialize()
    @@h_prefixes, @@h_reg_groups = Hash.new, Hash.new
    load_xml(@@h_prefixes, @@h_reg_groups, XML_ADDRESS)
  end

  def fake_isbn(*args)
    p_start = args[0][:start].to_s unless args[0].nil?
    p_range = args[0][:range].to_s unless args[0].nil?
    if (p_start.nil? or p_range.nil?)
      p_start = @@h_reg_groups.to_a[Random.new.rand(0..(@@h_reg_groups.length - 1))][0].delete("^0-9") if p_start.nil?
      p_range = random(13 -(p_start.length + 1)) if p_range.nil?
    else
      p_range << random((13 -(p_start.length + 1)) - p_range.length)
    end 
    clean_number = p_start.to_s << p_range.to_s
    Hyphenizer.new(@@h_prefixes, @@h_reg_groups).hyphenize(clean_number << checksum_generator(clean_number))
  end

end
end