c = get_config()

# Run all nodes interactively
# In Jupyter it allows to print several out variable
# from single cell.
# x, y = 0, 1
# x;
# y;<Enter>
# prints
# 1
# 0
# 2 vars at a time! woh!
c.InteractiveShell.ast_node_interactivity = "all"
