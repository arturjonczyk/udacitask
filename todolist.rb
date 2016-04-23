class TodoList
    attr_reader :title, :items

    # methods and stuff go here
    def initialize(list_title)
        @title = list_title
        @items = []
    end

    # add task to the list
    def add_item(new_item)
        item = Item.new(new_item)
        @items << item
    end

    # printing well formated title of the todo list
    def print_list_title
        puts '-' * @title.length
        puts @title
        puts '-' * @title.length
    end

    # printing title of the list and every task
    def print_items
        # printing title of the ToDo list
        print_list_title

        # printing each task like so: '1 - "Name of the task"  Completed: false'
        @items.each_with_index do |item, index|
            puts "#{index + 1} - #{('"' + item.description + '"').ljust(15, " ")} Completed: #{item.completed_status}"
        end
    end

    # removing specific task
    def delete_item(index)
        @items.delete_at(index - 1)
    end

    # changing status on specific task
    def update_status(index, status)
        new_status = status ? true : false
        @items[index - 1].completed_status = new_status
    end

    # changing the title of the todo list
    def update_title(new_title)
        @title = new_title
    end
end

class Item
    attr_accessor :completed_status
    attr_reader :description

    # methods and stuff go here
    def initialize(description)
        @description = description
        @completed_status = false
    end
end
