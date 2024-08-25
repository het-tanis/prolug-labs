Your team has to integrate with a U.S. Government system. There is a security requirement that you need to STIG (Security Technical Implementation Guide) your servers to a certain score. You have decided to use the SCC tool to scan your servers to see where they are currently at before any remediation.

Download and install the SCC tool.

Configure and Run the SCC tool for your OS.

Verify the output and see where the results are stored on your system.

<br>

### Solution
<details>
<summary>Solution</summary>
Create a directory to facilitate your work.

```plain
mkdir /root/scc
cd /root/scc
```{{exec}}

Download the SCC tool from the Govenment site.

```plain
wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/scc-5.10_ubuntu18_ubuntu20_amd64_bundle.zip -O scc-5.10_ubuntu18_ubuntu20_amd64_bundle.zip
```{{exec}}

Unzip the scc tool.

```plain
unzip scc-5.10_ubuntu18_ubuntu20_amd64_bundle.zip
```{{exec}}

Change to the correct unzipped directory.

```plain
cd /root/scc/scc-5.10_ubuntu18_amd64/
```{{exec}}

Install the package with the dpkg installer.

```plain
dpkg -i scc-5.10.ubuntu.18_amd64.deb
```{{exec}}

Watch installer. Where does it say that the package has been installed?

Change directories to where the SCC tool is intalled.

```plain
cd /opt/scc
```{{exec}}

Configure and run the SCC command line scanner tool (cscc)

```plain
/opt/scc/cscc --config
```{{exec}}

Look at the menu and Acknowledge the change log by hitting Enter key.

Select Option 1: Configure SCAP content.

Use the numbers to deselect 1 and 3, so you only have "Canonical_Ubuntu_20-04_LTS_STI" selected.

Hit 0 and Enter to return to the main menu.

Hit 6 to enter Configuration Options.

Hit 1 to enter Scanning Options

Turn on option 1, "Run all SCAP content regardless of applicability"

Hit 0 and Enter to return to the previous.

Hit 0 and Enter to return to the main menu.

Hit 9 to scan and exit the tool
	
    This may take up to 5 minutes
	
    Watch the scan to see what it is doing.

When the scan completes, what is the score that you have?

What is the output directory of the Reports?

You are ready to head to the next part of the lab.

</details>
