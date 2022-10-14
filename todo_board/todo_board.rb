require_relative 'list'
require_relative 'item'
class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)

        when 'up'
            @list.up(*args)

        when 'down'
            @list.down(*args)

        when 'swap'
            @list.swap(*args)

        when 'sort'
            @list.sort_by_date!

        when 'priority'
            @list.print_priority

        when 'print'
            @list.print

        when 'toggle'
            @list.toggle_index(*args)

        when 'rm'
            @list.remove_item(*args)

        when 'purge'
            @list.purge

        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        until get_command == false
            get_command
        end
    end
end
