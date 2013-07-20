module FunctionLib
  require 'xml'
  require 'open-uri'
  XML_ADDRESS = "http://www.isbn-international.org/agency?rmxml=1"
  IBSN_INVALID = "Ibsn Number is invalid"

  
  def resolve_length(prefix, five_digits, base_hash)
    value = nil
    base_hash[prefix].each do |range|
      value = range[0] if (five_digits.to_i >= range[1].to_i/100 and five_digits.to_i <= range[2].to_i/100 )
    end
    value
  end
  def load_xml(h_prefixes, h_reg_groups, xml_address)
    parse_xml("EAN.UCCPrefixes", "EAN.UCC", h_prefixes, xml_address)
    parse_xml("RegistrationGroups", "Group", h_reg_groups, xml_address)
  end

  def parse_xml(str_root, str_entry, base_hash, xml_address)
    xml = open(xml_address).read if xml.nil?
    parser, parser.string = XML::Parser.new, xml
    doc, posts = parser.parse, []
    doc.root.find("./"+str_root).each do |entry|
      entry.find(str_entry).each do |entry2|
        prefix, base_hash[prefix] = entry2.find_first("Prefix").content, []
        entry2.find("Rules").each do |entry3|
          entry3.find("Rule").each do |entry4|
            range, length = entry4.find_first("Range").content, entry4.find_first("Length").content 
            range_splitted = range.split("-") 
            base_hash[prefix] << [length, range_splitted[0], range_splitted[1]]
          end
        end
      end
    end
  end
end
