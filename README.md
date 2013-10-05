# Manpage 2 PDF

man2pdf is a **BASH** script that read a [`manpage`](http://en.wikipedia.org/wiki/Man_page) and pipe it to Preview to open up so you can save it as a `PDF` for later viewing, or just easier viewing!

It works best if placed in `/usr/bin` as you can then run it from Terminal without having to use the `./` or the `sh` commands to load it up. At this point, I haven't managed to get it to install there by itself. That is currently in the feature list.

#### Usage
Fire up Terminal and navigate to `/usr/bin`:
````shell
$ cd /usr/bin
````

Download the file with **cURL**, this will require `sudo` access because it's a protected directory on OS X.
````shell
$ sudo curl "https://raw.github.com/danijeljames/man2pdf/master/man2pdf.sh" -o man2pdf.sh
````

Now make that file executable for later
````shell
$ sudo chmod +x man2pdf.sh
````

You can also do this with 1 really long command in a single pass:
````shell
$ cd /usr/bin && sudo curl "https://raw.github.com/danijeljames/man2pdf/master/man2pdf.sh" -o man2pdf.sh && sudo chmod +x man2pdf.sh
````

Then, when you need a `manpage` written out to a more readable format, just type in the name of the article you want:
````shell
$ man2pdf curl
````

This will pipe the contents of that page into `Preview`, which is so much clearer. And I can print it without issues!


#### Feature Implementation List
 1. Automatic installer for first time use to correct directory
 2. ~~Built-in ReadMe when user needs assistance in usage~~
 3. Add additional functionality:
	1. Extra switch to save PDF automatically
	2. Specify location of saving PDF
	3. Switch to save file to other format
	4. Settings file that can save all settings for on-going use
