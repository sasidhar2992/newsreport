
    dir = 'zipfolder';

    output_dir = "app/assets/xmls" 

    files = Dir.glob("zipfolder/*.zip").each do |item|
      Zip::File.open(item) do |zip_file|
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
