class Item

    attr_accessor :title, :deadline, :description
    attr_reader :done
    def self.valid_date?(str)
        date = str.split('-')
        if date[0].to_i < 999
            return false
        end
        if date[1].to_i > 12
            return false
        end

        if date[2].to_i > 31
            return false
        end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        @done = false

        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise 'error'
        end
    end

    def toggle
        @done = true
    end
end
