### Lab Activities

You want to rapidly build the project every time the static index.html changes. You decide to use inotifywait and watch for changes to the file to kick off your packer build in the environment.

<br>
<details>
<summary>Solution</summary>

Install inotify-tools in the environment

```plain
apt -y install inotify-tools
```{{exec}}

Build the watcher script /root/packer/watcher.sh

```plain
vi /root/packer/watcher.sh
```{{exec}}

Press "i" and add the following lines

```plain
#!/bin/bash

WATCH_DIR="/root/packer"
EVENTS="create,close_write,delete,moved_to" # Events to watch for

# -m: monitor indefinitely
# -r: recursive (watch all subdirectories)
# --format '%w%f%0': output format: watched path, filename, and a NUL terminator (%0)
# --no-newline: prevents extra newlines, necessary when using the NUL terminator
inotifywait -m -r -e "$EVENTS" --format '%w%f%0' --no-newline "$WATCH_DIR" |
while IFS= read -r -d '' file; do
    
    if [ $file == "/root/packer/index.html" ]; then
        echo "Event detected on file: $file" >> /root/packer/change.log
        echo "Rebuilding docker image with 'packer build .' " >> /root/packer/change.log
    fi
done
```

Make the watcher executable

```plain
chmod 755 /root/packer/watcher.sh
```{{exec}}

Start the watcher running

```plain
nohup ./watcher.sh &
```{{exec}}

hit enter

Modify the /root/packer/index.html page

```plain
echo "somechange" >> /root/packer/index.html
```{{exec}}

Verify that the change caused an event to trigger in /root/packer/change.log

```plain
cat /root/packer/change.log
```{{exec}}

This just tests the functionality of a trigger. But do you see how this could be useful to automate a build process?

Where might you use this in your daily activities on your systems?

This does not address the deployment of the container from a rebuilt image. This will be done in the next lab.

</details>