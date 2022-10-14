require_relative 'list'
require_relative 'item'
class TodoBoard

    def initialize()
        @list = {} ##List.new(label)
        #@list[label] = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd,li, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @list[li] = List.new(li)
        when 'mktodo'
            @list[li].add_item(*args)

        when 'up'
            @list[li].up(*args)

        when 'down'
            @list[li].down(*args)

        when 'swap'
            @list[li].swap(*args)

        when 'sort'
            @list[li].sort_by_date!

        when 'priority'
            @list[li].print_priority

        when 'print'
            @list[li].print

        when 'toggle'
            @list[li].toggle_index(*args)

        when 'rm'
            @list[li].remove_item(*args)

        when 'purge'
            @list[li].purge

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
