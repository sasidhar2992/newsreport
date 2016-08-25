module Unzip
  require 'uri'
  require "httparty"

  output_dir = "app/assets/xmls" 

  zipfile = Tempfile.new("file")
  zipfile.binmode # This might not be necessary depending on the zip file
  zipfile.write(HTTParty.get("http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/1471852899675.zip").body)
  zipfile.close
  Zip::File.open(zipfile.path) do |zip_file|
    # Handle entries one by one
    zip_file.each do |entry|
    # Extract to file/directory/symlink
      if not File.exists?("app/assets/xmls/#{entry.name}") then 
          puts "Extracting #{entry.name}.inspect"
          #entry.extract(dest_file)
          entry.extract("#{File.expand_path(output_dir)}/#{entry.name}")
          # Read into memory
          content = entry.get_input_stream.read
      end
    end
  end 
end
