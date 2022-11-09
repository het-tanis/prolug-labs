Inspect our /root/.screenrc file

Start screen.

Create multiple screen windows, rename them, and move between them.

<br>

### Solution
<details>
<summary>Solution</summary>
Verify your /root/.screenrc file

```plain
cat /root/.screenrc
```{{exec}}

Create a screen session

```plain
screen
```{{exec}}

Split the screen horizontally 

```plain
Ctrl A + S
```

Jump between the horizontal screen sessions
```
Ctrl A + 'Tab Key'
```

Rename the window you're in "Window1"

```plain
Ctrl A + A
```

Create a new window and name it "Window2"

```plain
Ctrl A + C
Ctrl A + A
```

 
</details>