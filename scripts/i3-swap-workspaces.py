#!/usr/bin/env python3

from i3ipc import Connection

i3 = Connection()

outputs = i3.get_outputs()
workspaces = i3.get_workspaces()
focused_workspace = i3.get_tree().find_focused().workspace().name

print('List of all workspaces:')
for workspace in workspaces:
    print(f"Name {workspace.name} | Num {workspace.num} | Visible: {workspace.visible} | Focused: {workspace.focused} | Output: {workspace.output}")

print('Get active workspaces')
active_workspaces = [workspace.name for workspace in filter(lambda w: w.visible and not w.focused, workspaces)]

print('Move workspaces to first another output:')
for workspace in workspaces:
    for output in filter(lambda o: o.active, outputs):
        if output.name != workspace.output:
            command = f'[workspace="{workspace.name}"] move workspace to output {output.name}'
            print(command)
            i3.command(command)

print('Focus on workspace (active workspaces):')
for ws in active_workspaces:
    command = f'workspace "{ws}"'
    print(command)
    i3.command(command)

print('Focus on workspace (focused workspace):')
command = f'workspace "{focused_workspace}"'
print(command)
i3.command(command)