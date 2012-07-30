require '../lib/dfxml'
require '../lib/dfxml/parser'
require 'nokogiri'

reader = Nokogiri::XML::Reader(File.new('M1126-0022.xml'))

docs = Array.new
while reader.read
  if reader.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT and reader.name == 'fileobject'

    file_object = Dfxml::Parser::FileObject.parse(reader.outer_xml)  
    
    puts file_object.filename
    if file_object.pronom_puid
      puts "\t" << file_object.pronom_format
      puts "\t" << file_object.pronom_puid
      puts "\t" << file_object.pronom_identification_method
    end
  elsif reader.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT and reader.name == 'ftype_str'
    puts reader.read.value
  end
end