Tmux session detachment and attachment, killing tmux sessions.

Creating new tmux sessions

Creating logs for panes within windows to /root/logs-tmux.log

Leaving behind processes with tmux

<br>

### Solution
<details>
<summary>Solution</summary>

Detatch from tmux session

```plain
ctrl + b and d
```

Verify that tmux session is still running

```plain
tmux ls
```{{exec}}

Reconnect to that session

```plain
tmux a -t 0
```{{exec}}

Kill your last tmux session, and list your sessions.

```plain
tmux kill-session
```{{exec}}

```plain
tmux list-sessions
```{{exec}}

Create a new session for tmux

```plain
tmux 
```{{exec}}

Log the output of a pane to a file

```plain
tmux pipe-pane -o "exec cat >>$HOME/'logs-tmux.log'"
```{{exec}}

Execute a command that keeps on running

```plain
while true; do uptime; sleep 1; done
```{{exec}}

Detach the tmux session

```plain
ctrl + b and d
```

Let's follow the output associated with that pane with `tail -f`
Press `ctrl+c` to exit out of `tail -f`

```plain
tail -f $HOME/'logs-tmux.log'
```{{exec}}

Attach to the last session once again and cancel the process with `ctrl+c`

```plain
tmux a
```{{exec}}

Close all tmux sessions

```plain
tmux kill-server
```{{exec}}

</details>