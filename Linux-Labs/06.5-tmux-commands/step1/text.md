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
apt -y install tmux
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

Create a new pane horizontaly

```plain
ctrl + b and "
```

Create a new pane vertically

```plain
ctrl + b and %
```

Jump between your panes in your window

```plain
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

Move between windows in your session by number

```plain
ctrl+b and 0
```

View all sessions and their associated windows and panes.
Move with your arrow keys and press `enter` to select your window.

```plain
ctrl+b and w
```

</details>