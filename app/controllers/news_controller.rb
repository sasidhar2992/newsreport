class NewsController < ApplicationController
  def index
    require 'zip'
    require 'nokogiri'
    require 'pp'
    require_relative 'unzip' 
    require_relative 'urlinspect'
 
    k = 0
    @hash = []
     
    xfiles = Dir.glob("app/assets/xmls/*.xml").each do |xitem|
      #iterate through each xmlfile
      unless k>=40
        puts xitem
        path = xitem;
        @hash << Hash.from_xml(File.read(xitem))
          $redis.SADD("NEWS_XML", @hash)
          #create a redis set with values from the hash instance
        #puts hash.inspect 
      end
      k += 1;
    end
  end
end