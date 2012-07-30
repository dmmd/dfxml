require '../lib/dfxml'
require '../lib/dfxml/parser'
require 'nokogiri'

reader = Nokogiri::XML::Reader(File.new('M1126-0008.xml'))

docs = Array.new
while reader.read
  if reader.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT and reader.name == 'fileobject'
    puts "New File"
    file_object = Dfxml::Parser::FileObject.parse(reader.outer_xml)  
    if file_object.pronom_puid
      puts file_object.pronom_format
      puts file_object.pronom_puid
      puts file_object.pronom_identification_method
    end
  end
end