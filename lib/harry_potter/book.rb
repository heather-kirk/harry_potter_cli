require 'pry'

class HP::Book

  attr_accessor :title, :author, :details

  @@all = []

  def initialize
    @title = title
    @author = author 
    @details = details
  end 
  
  def save
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 

end 