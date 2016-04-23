class TodoList
    attr_accessor :title
    attr_reader :items

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

    # removing specific task
    def delete_item(index)
        @items.delete_at(index - 1)
    end

    # changing status on specific task
    def update_item_status(index, status)
        @items[index - 1].update_task_status(status)
    end

    # printing well formated title of the todo list
    def print_formated_list_title
        puts '-' * @title.length
        puts @title
        puts '-' * @title.length
    end

    # printing title of the list and every task
    def print_items
        # printing title of the ToDo list
        print_formated_list_title

        # printing each task
        @items.each_with_index do |task, index|
            puts "#{index + 1} - #{task.print_task}"
        end
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

    def update_task_status(status)
        @completed_status = status
    end

    def print_task
        "#{('"' + @description + '"').ljust(30, " ")} Completed: #{@completed_status}"
    end
end
