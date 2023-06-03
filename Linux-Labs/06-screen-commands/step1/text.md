You are a new system engineer for a small Linux based tech company. The other engineers set you up with a tool called screen and gave you a basic configuration file for it. Inspect the configuration and see what advantages you can find for this tool in your daily system activities.

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

Verify that you are attached in screen

```plain
screen -ls
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