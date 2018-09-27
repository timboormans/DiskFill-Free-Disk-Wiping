# DiskFill (military grade disk wiping using a Windows Batch file)
Many years ago i had a large staple of harddisk which had to be trashed but still
contained many files which were easily recoverable using free tools. I found out
that there are different tools: tools to erase files, tools to wipe deleted files
and so called harddisk killers.

### The commercial tools cannot compete
All tools have a different grade and purpose. I bought a license for KillDisk Pro which
cost me about 175 euro at that time. What it does is writing zeros or random patterns to
your harddisk and it hopes to wipe all your previously deleted files. But actually, it
does not. Not everything.

None of all the dozens of tools that i tested wiped everything. Even military grade
wiping tools did not delete everything. So that was my main reason for this little hobby
project.

### My Research
In my little research i dug into the internet archives and read about how the disk partition
table is being used by the OS; how your files are written and deleted and why files can be found
back after deletion. Everywhere on the internet you can read that a file deletion triggers to
remove the first byte of the file and then it appears as being deleted. The more important part
of that story is that your Windows OS is not overwriting these disk sectors until it really needs
to. Which makes that deleted files are easily recoverable by any tool. Which is great, but not
when you try to get rid of your deleted files which in my case was a copy of my passport.

### The core of the solution
That brings me to my final point: the FAT partitioning table can contain a maximum of 65535
entries. When you put files in a folder things can be compacted into a tree of files. So when
you want to fill up the table you need to store dozens of files in your disk root.

When working with NTFS the disk contains sectors of for example 64KB each. Having a picture of 50KB
places the picture inside one sector, leaving 14KB space unused. The next picture is being saved into
the next sector. When you delete the 50KB file that 50KB is not used anymore until you
run out of disk space. When you would write zeros using 1GB files to your disk in surge to wipe
your disk then these sectors are still being ignored. Wiping does not make sense!

## My solution, follow preparation for best result
The solution is so easy that most people don't think about it and buy an expensive tool to make
it work. So, what needs to be done to delete all old files: create loads of small files on your
harddisk root which perfectly fit into each sector and with it fill the disk until you run out of
space. When the end is near it will consume all sector spacing and thus overwrite all your
previously deleted files. After a reboot nothing is recoverable anymore!

To boost maximum results i created these guidelines:

1. Make sure to have Windows installed, which can be a clean install.
2. If not a clean install:
    1. Erase all history of your browsers and applications
    2. Erase all files in your %TEMP% and %TMP% folder
    3. Empty your Recycle Bin
    4. Create a new Windows user
    5. Remove all existing Windows users using the Configuration Screen > Users (which is the only way to also delete the complete profile on disk). If the folder is not erased then reboot and manually try to remove (parts of) C:\Users\ or C:\Documents And Settings\.
    6. Disable System Restore
    7. Disable Windows Virtual Memory
    8. Optionally Defragment your disk, which can overwrite clusters already.
3. Reboot your computer to active all previous changes
4. Uninstall antivirus (slows down the script enormously)
5. Disable the Windows default antivirus which activates when a 3rd party tool is not present (slows down the script enormously)
6. If the disk to wipe is not your Windows disk, then remove the partions and recreate it as one single full size partion and format the disk (extensive, not quick format).
7. Use a tool called Restoration (https://www.lifewire.com/restoration-review-2622884) to see if you already got to the point where you wanted to be.

## Use my free tool
1. Place my Windows Batch files called 'fill.bat' and 'clean.bat' into the root folder of the disk you want to wipe.
2. Execute fill.bat as many times simultaneously to maximize impact and throughput. The best performance changes per computer.
3. Wait until Windows tells you that your disk is full (see screenshots). Then kill all scripts and reboot.
4. Open a Command Prompt (cmd.exe) and run c:\cleanup.bat to free up space. Reboot afterwards.
5. Use Restoration.exe to find your happiness :-)

YOU WILL NOT FIND ANY PERSONAL FILE!


##### References
- File: references/FAT.gif (copyright Computer Desktop Encyclopedia)
- URL: http://en.wikipedia.org/wiki/File_Allocation_Table#File_Allocation_Table


##### Author notes
* Use at your own risk.
* I am not sure if SSD likes this way of working, therefor only use this guide when you want to trash your disk anyway!