require 'open-uri'

class Coin < ApplicationRecord
  scope :favorite, -> { where(marked: true) }
  
  def self.fetch_all(max_pages: 999)
    parse_page("https://coinmarketcap.com/1", pages_parsed: 0, max_pages: max_pages)
  rescue OpenURI::HTTPError
    puts "No more pages left."
  end
  
  def self.parse_page(url, pages_parsed:, max_pages:)
    return if pages_parsed == max_pages
    
    page = Nokogiri::HTML open(url)
    
    page.css("table#currencies tbody > tr").each do |currency|
      Coin.create(
        name: currency.css(".currency-name-container").text,
        ticker: currency.css(".currency-symbol a").text,
        marketcap: currency.css("td.market-cap").attr("data-usd").text.to_f,
        price: currency.css(".price[data-usd]").attr("data-usd").text.to_f,
        supply: currency.css("[data-supply]").attr("data-supply").text.to_f)
    end
    
    pages_parsed += 1
    
    next_page_url = "https://coinmarketcap.com/#{pages_parsed+1}"
    parse_page(next_page_url, pages_parsed: pages_parsed, max_pages: max_pages)
  end
end
