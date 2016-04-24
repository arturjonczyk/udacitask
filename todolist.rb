require 'time'

class TodoList
    attr_accessor :title, :items
    attr_reader :items

    # methods and stuff go here
    def initialize(list_title)
        @title = list_title
        @items = []
        @sort_by = "time"
    end

    # add task to the list
    def add_item(new_item, priority=false)
        item = Item.new(new_item, priority)
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

    # change priority status of task: true or false
    def change_priority_status(n)
        @items[n - 1].priority = @items[n - 1].priority ? false : true
    end

    def sort_tasks_by_priority
        @items.sort_by! { |task| [task.priority ? 0 : 1]}

        # change sort method to sort_tasks_by_priority
        @sort_by = "priority"
    end

    def sort_tasks_by_time_creation
        @items.sort_by! { |task| task.time}

        # change sort method to sort_tasks_by_time_creation
        @sort_by = "time"
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

        # checking the current sort method
        @sort_by == "time" ? sort_tasks_by_time_creation : sort_tasks_by_priority

        # printing each task
        @items.each_with_index do |task, index|
            puts "#{index + 1} - #{task.print_task}"
        end
    end
end


class Item
    attr_accessor :completed_status, :priority, :time
    attr_reader :description

    # methods and stuff go here
    def initialize(description, priority)
        @description = description
        @completed_status = false
        @priority = priority
        @time = Time.now
    end

    # changing status of the task
    def update_task_status(status)
        @completed_status = status
    end

    # returning "true" if status is "done"
    def completed?
        @completed_status
    end

    def print_task
        "#{('"' + @description + '"').ljust(26, " ")} Completed: #{ (completed? ? "*done*" : "not done").ljust(15, " ")} Priority: #{@priority}"
    end
end
