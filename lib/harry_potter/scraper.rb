require_relative "./version.rb"

class HP::Scraper
  
  def scrape_books
  doc = Nokogiri::HTML(open("https://harrypotter.bloomsbury.com/uk/bookshop/illustrated-editions/harry-potter-illustrated-editions/"))
  
  doc.search("div.caption").each do |book|
    
    new_book = HP::Book.new
    new_book.title = book.search("h2.HP-Product").text.gsub("\r", " ").squeeze(" ").strip
    new_book.author = book.search("p.author").text.gsub("\r", " ").squeeze(" ")
    new_book.details = book.search("tbody").text.gsub("\r\n", " ").squeeze(" ").strip
    new_book.save
  
    end 
  end 
end 


