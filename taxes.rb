class Order
  def self.run
    order = self.new
  end

  def initialize
    @products = []

    while true
      display_menu

      print "Please enter an option [1-3]: "
      choice = gets.chomp.to_i

      if choice == 1
        add_product
      elsif choice == 2
        display_receipt
      elsif choice == 3
        exit_program
      else
        puts "Unable to process input.  Please select again"
      end
    end
  end

  def display_menu
    puts "[1] Add Item"
    puts "[2] Get Receipt"
    puts "[3] Exit"
  end

  def add_product
    puts "Add a product."
  end

  def display_receipt
    puts "Displaying receipt."
  end

  def exit_program
    puts "Goodbye!"
    exit
  end
end

class Product
  attr_reader :item, :price, :taxable, :imported

  def initialize
    name?
    price?
    taxable?
    imported?
  end

  def name?
    print "Enter the name of the product: "
    @item = gets.chomp
  end

  def price?
    print "How much is each #{@item}"
    @price = gets.chomp.to_f
  end

  def taxable?
    print "Is #{@item} a book, food or medical product? [Y/N]"
    response = gets.chomp
    @taxable = (response == "y" || response == "yes")
  end

  def imported?
    print "Is #{@item} imported? [Y/N]"
    response = gets.chomp
    @imported = parse_response(response)
  end

  private

  def parse_response(response)
    response = response.downcase
    response == "y" || response == "yes"
  end
end

Order.run

# order_one.add_line_item("1 book at 12.49")
# order_one.add_line_item("1 music CD at 14.99")
# order_one.add_line_item("1 chocolate bar at 0.85")

# order_two.add_line_item("1 imported box of chocolates at 10.00")
# order_two.add_line_item("1 imported bottle of perfume at 47.50")

# order_three.add_line_item("1 imported bottle of perfume at 27.99")
# order_three.add_line_item("1 bottle of perfume at 18.99")
# order_three.add_line_item("1 packet of headache pills at 9.75")
# order_three.add_line_item("1 box of imported chocolates at 11.25")
