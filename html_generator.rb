require "json"
require "open-uri"

class HtmlGenerator
  
  def show
    print_header
    puts "Action: Show"
    print_footer
  end

  def index
    print_header
    puts "Action: Index"

    products = retrieve_data

    products.each do |product|
      display_product(product)
    end

    print_footer
  end

  private

  def display_product(product)
    puts "<p><h3>#{product['name']}</h3></p>"
    puts "<p>$#{product['regular_price_in_cents']/100}</p>"
    puts "<img src='#{product['image_thumb_url']}'>"
    puts "<p>#{product['producer_name']}</p>"
    puts "<p>#{product['package']}</p>"
  end

  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
  end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end

  def retrieve_data
    response = open("http://lcboapi.com/products.json").read
    data = JSON.parse(response)
    return data["result"]
  end
















end