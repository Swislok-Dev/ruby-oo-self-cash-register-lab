require "pry"

class CashRegister
    attr_accessor :total, :discount, :title, :price, :items, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        quantity = quantity
        @last_item = price * quantity
        @total += price * quantity
        while quantity > 0
            @items << title
            quantity -= 1
        end
    end

    def apply_discount
        @total -= (@discount / 100.0) * @total
        if @discount > 0
            "After the discount, the total comes to $#{@total.to_i}." 
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_item
        if @items.empty?
            return @total = 0.0
        else
            return @total
        end
    end

end