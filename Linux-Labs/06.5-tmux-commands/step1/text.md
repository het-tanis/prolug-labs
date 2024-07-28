You are a new system engineer for a small Linux based tech company. You have overheard the other system engineers are using tmux and how awesome it is, you've inquired them on why they are currently using it and thus they have given you a sample configuration file to use and setup your own tmux multiplexer.

Let's inspect our ~/.tmux.conf file

Start tmux.

Create multiple tmux panes and windows, rename them, and move between them.

<br>

### Solution
<details>
<summary>Solution</summary>

Install tmux

```plain
dnf install tmux -y
```{{exec}}

Verify your /root/.tmux.conf file

```plain
cat /root/.tmux.conf
```{{exec}}

Create a tmux session

```plain
tmux
```{{exec}}

Verify that you are attached in tmux

```plain
tmux ls
```{{exec}}

In Tmux a command usually starts with a prefix key `ctrl+b` and than a key to activate an action.

Split the tmux Horizontally

```plain
ctrl + b and "
```

Split the tmux Vertically

```plain
ctrl + b and %
```

Jump between the horizontal tmux sessions

```
ctrl + b and [Arrow Keys] < ^ >
```

Rename your current window to "Window1"

```plain
ctrl + b and ,
```

Create a new window and name it "Window2"

```plain
ctrl + b and c
ctrl + b and ,
```

Move between the windows

```plain
ctrl+b and 0
```

</details>