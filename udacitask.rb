require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("Things to learn")

# Add four new items
list.add_item("Variables")
list.add_item("Arrays")
list.add_item("Hashes")
list.add_item("Classes")

# Print the list
list.print_items

# Delete the first item
list.delete_item(1)

# Print the list
list.print_items

# Delete the second item
list.delete_item(2)

# Print the list
list.print_items

# Update the completion status of the first item to complete
list.update_item_status(1, true)

# Print the list
list.print_items

# Update the title of the list
list.title = "Happy Learning List:"

# Print the list
list.print_items
