from i3ipc import Connection

i3 = Connection()

workspace_no = i3.get_tree().find_focused().workspace().num
new_workspace_no = 1 if (workspace_no + 1) > 10 else (workspace_no + 1)

command = f'move container to workspace number {new_workspace_no}'
print(command)
i3.command(command)

command = f'workspace number "{new_workspace_no}"'
print(command)
i3.command(command)