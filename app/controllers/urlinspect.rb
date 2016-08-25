require 'open-uri'
download = open('http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts')
IO.copy_stream(download, 'C:\Users\sasidhar\Desktop\ruby_projects\articles\newsreport\zipfolder\file1.txt')