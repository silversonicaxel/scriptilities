# loop command output

### Usage:

```
loop-command-output.sh <file_extension> <destination_folder> <command_for_file>
```

### Description:

This script utility loops the current folder, searching for files with a
specific extension and applies a command, storing the standard output in a
destination output folder.

### Arguments:

<file_extension> The extension of the files to process
<destination_output_folder> The folder where command standard output is stored
<command_for_file> The command to be run against every processed file
