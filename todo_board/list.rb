require_relative 'item'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title=false, deadline=false, description=false)
        if title == false && title == false && title == false
            return false
        else
            @items << Item.new(title,deadline, description)
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(i)
        i < size
    end

    def swap(i1, i2)
        if valid_index?(i1.to_i )&& valid_index?(i2.to_i )
            @items[i1.to_i ], @items[i2.to_i ] = @items[i2.to_i ], @items[i1.to_i ]
            return true
        else
            return false
        end
    end

    def [](i)
        if valid_index?(i)
            @items[i]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "index  title  description  deadline"
        @items.each_with_index do |item, i|
            puts "#{i}  #{item.title}  #{item.description}  #{item.deadline} done:#{item.done}"
            puts
        end
    end


    def print_full_index(i)
        if valid_index?(i)
            puts " #{@items[i].title}  #{@items[i].deadline}"
            puts " #{@items[i].description} done: #{items[i].done}"
        else
            nil
        end
    end

    def print_priority
        print_full_index(1)
    end

    def up(i, amt)
        i = i.to_i
        if valid_index?(i)
            amt.times do |k|
                @items[i], @items[i-1] = @items[i-1], @items[i]
                i= i-1
            end
        end
    end

    def down(i, amt)
        if valid_index?(i.to_i)
            amt.times do
                @items[i.to_i], @items[i.to_i+1] = @items[i.to_i+1], @items[i.to_i]
                i.to_i = i.to_i + 1
            end
        end
    end

    def sort_by_date!
        @items = @items.sort_by! {|item| item.deadline.split('-').join('').to_i}
    end

    def toggle_index(i)
        if valid_index?(i.to_i)
            @items[i.to_i].toggle
        end
    end

    def remove_item(i)

        if valid_index?(i.to_i)
            @items.delete_at(i.to_i)
        end
    end

    def purge
        @items = @items.select {|ele| ele.done == false}
    end


end
