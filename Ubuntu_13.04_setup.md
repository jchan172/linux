Ubuntu 13.04 with Gnome 3 Setup
===============================


## Most Efficient Workflow

### Use terminal to install stuff

Add repositories

	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

	sudo add-apt-repository ppa:webupd8team/sublime-text-2
	sudo add-apt-repository ppa:webupd8team/themes

Update repositories

	sudo apt-get update

	sudo apt-get install banshee nautilus-open-terminal dos2unix gcc build-essential dkms nspluginwrapper curl perl-Tk unrar p7zip-full gimp vlc sublime-text google-chrome-stable flashplugin-installer ibus-googlepinyin vim adwaita-x-dark-theme gstreamer1.0-plugins-ugly gstreamer1.0-libav

	gsettings set org.gnome.shell.clock show-date true
	gsettings set org.gnome.shell.clock show-seconds true
	gsettings set org.gnome.shell.overrides button-layout ':minimize,maximize,close'

### Make Sublime Text 2 as default text editor

Check that sublime-text-2.desktop exists in `/usr/share/applications/`

	sudo subl /usr/share/applications/defaults.list

Now find all the gedit.desktop entries and replace it with sublime-text-2.desktop
Save and quit

### Tweak Sublime Text 2

**First install Package Control**

Open the Sublime Text 2 console by doing Ctrl + ` (grave symbol)

Paste the following:

	import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print('Please restart Sublime Text to finish installation')

Restart Sublime Text 2

Go to Preferences -> Package Control

Type in "Package Control: Install Package" and hit enter

Type in "Soda theme" and click on "Theme - Soda" to install

Restart Sublime Text 2

**Now add customizations:**

Replace `~/.config/sublime-text-2/Packages/Theme - Soda/Soda Dark.sublime-theme` with my version. This version has bigger font.

Add "Monokai Dark.tmTheme" to `~/.config/sublime-text-2/Packages/Color Scheme - Default/`

Go into Sublime Text 2 -> Preferences -> Color Scheme -> and choose "Monokai Dark".

### Install Sublime Text 3

Download Sublime Text 3 beta version.

	sudo dpkg -i sublime-text_build-30xx-i386.deb

### Tweak Sublime Text 3

First install Package Control

	cd /home/jchan/.config/sublime-text-3/Packages
	git clone https://github.com/wbond/sublime_package_control.git "Package Control"
	cd "Package Control"
	git checkout python3

Restart Sublime Text 3

Go to Preferences -> Package Control

Type in `Package Control: Install Package`and hit enter

Type in `Soda theme` and click on `Theme - Soda` to install

Restart Sublime Text 3

Now add customizations: 

Put "Soda Dark 3.sublime-theme" into `~/.config/sublime-text-3/Packages/User/`. This version has bigger font.

Add "Monokai Dark.tmTheme" to `~/.config/sublime-text-3/Packages/Color Scheme - Default/`. The folder will need to be created.

Go into Sublime Text 3 -> Preferences -> Color Scheme -> and choose "Monokai Dark". It will be at the bottom of the list.

### Make Sublime Text 3 as default text editor

Check that sublime_text.desktop exists in `/usr/share/applications/`

	sudo subl /usr/share/applications/defaults.list

Now find all the gedit.desktop entries and replace it with sublime_text.desktop

Save and quit

### Install "Elementary" Icons

Download "Elementary" icons and extract it

Go into `elementary/apps/` and you will see 16, 22, 24, ... folders

Go into each of them and delete the chrome icons. They suck.

Now put the folder into ~/.icons/

Open Tweak-Tool (`gnome-tweak-tool`) and go to "Theme" on the left panel

Switch "Icon theme" to "Elementary"

### Install "Adwaita-X-dark" Theme

	sudo add-apt-repository ppa:webupd8team/themes
	sudo apt-get update
	sudo apt-get install adwaita-x-dark-theme


Open Tweak-Tool (`gnome-tweak-tool`), go to "Theme" on the left panel

Select "Adwaita-X-dark" for both "Gtk+ Theme" and "Current theme"

### Install extensions for extra usability

Install dependencies first

	sudo apt-get install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0

Go to these sites at extensions.gnome.org, and switch button to "ON":

	https://extensions.gnome.org/extension/5/alternative-status-menu/
	https://extensions.gnome.org/extension/120/system-monitor/
	https://extensions.gnome.org/extension/97/coverflow-alt-tab/
	https://extensions.gnome.org/extension/112/remove-accesibility/

System monitor will move the clock, so to get the clock back into the middle, click on the system monitor and go to "Preferences..."

Then uncheck the "Move the clock" checkbox.

Pres Alt-F2 and enter `r` and press enter. This refreshes Gnome.

### Install Java JDK

Download the 32-bit or 64-bit .tar.gz file.

Extract it

	tar -xvf jdk-7u25-linux-i586.tar.gz

Move the JDK 7 directory to `/usr/lib` (`/usr/lib/jvm/` may already exist)
	
	sudo mv ./jdk.1.7.0_25 /usr/lib/jvm/jdk1.7.0

Install the JDK

	sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0/bin/java" 1
	sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0/bin/javac" 1
	sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.7.0/bin/javaws" 1

Correct file ownership and permissions of the executables

	sudo chmod a+x /usr/bin/java 
	sudo chmod a+x /usr/bin/javac 
	sudo chmod a+x /usr/bin/javaws
	sudo chown -R root:root /usr/lib/jvm/jdk1.7.0

Configure to use the correct java

	sudo update-alternatives --config java

You will see something like this:

	$sudo update-alternatives --config java
	There are 3 choices for the alternative java (providing /usr/bin/java).

	Selection 	Path 											Priority 	Status
	————————————————————
	* 0 		/usr/lib/jvm/java-7-openjdk-i386/jre/bin/java 	1061 		auto mode
	1 			/usr/lib/jvm/java-7-openjdk-i386/jre/bin/java 	1061 		manual mode
	2 			/usr/lib/jvm/jdk1.7.0/bin/java 				3 			manual mode

	Press enter to keep the current choice[*], or type selection number:

Choose the correct choice (in the example, it would be 2)

Repeat `sudo update-alternatives --config` for `javac` and `javaws` (might not be necessary)

Check if `java` is installed (should print version info)
	
	java -version

Check if `javac` is installed (should print version info)

	javac -version

Check if `javaws` is installed (should give bunch of options)
	
	javaws
	
Enable Firefox plugin (use amd64 instead of i386 for 64-bit system)

	sudo ln -s /usr/lib/jvm/jdk1.7.0_21/jre/lib/i386/libnpjp2.so usr/lib/firefox/plugins/

Open Firefox and go to about:plugins to verify

Enable Google Chrome plugin (use amd64 instead of i386 for 64-bit system)
	
	sudo mkdir /opt/google/chrome/plugins/
	sudo ln -s /usr/lib/jvm/jdk1.7.0_21/jre/lib/i386/libnpjp2.so /opt/google/chrome/plugins/

Open Chrome and go to chrome://plugins and click on Details to verify

Go to http://java.com/en/download/installed.jsp to verify Java works





## Reference and Other Notes

### Install smaller stuff with this One-Liner

    sudo apt-get install banshee nautilus-open-terminal dos2unix gcc build-essential dkms nspluginwrapper curl perl-Tk unrar p7zip-full gimp vlc sublime-text google-chrome-stable flashplugin-installer ibus-googlepinyin vim adwaita-x-dark-theme gstreamer1.0-plugins-ugly gstreamer1.0-libav exfat-fuse

### Install Google Chrome

	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

	sudo apt-get update
	sudo apt-get install google-chrome-stable

### Install Sublime Text 2

	sudo add-apt-repository ppa:webupd8team/sublime-text-2
	sudo apt-get update
	sudo apt-get install sublime-text

To change Sublime Text 2 to be the default editor

Check that sublime-text-2.desktop exists in `/usr/share/applications/`

	sudo subl /usr/share/applications/defaults.list

Now find all the gedit.desktop entries and replace it with sublime-text-2.desktop

Save and quit

### Install Adobe Flash Player for Firefox

Open Ubuntu Software Center

Search for 'adobe flash player'

Click "Install"

Or, to do it with terminal:
	
	sudo apt-get install flashplugin-installer

### Install "Elementary" Icons

Download "Elementary" icons and extract it

Go into the `elementary/apps/` and you will see 16, 22, 24, ... folders

Go into each of them and delete the chrome icons. They suck.

Now put the folder into `~/.icons/`

Open Tweak-Tool (`gnome-tweak-tool`) and go to "Theme" on the left panel

Switch "Icon theme" to "Elementary"

### Install "Adwaita-X-dark" Theme
	
	sudo add-apt-repository ppa:webupd8team/themes
	sudo apt-get update
	sudo apt-get install adwaita-x-dark-theme

Open Tweak-Tool (`gnome-tweak-tool`), go to "Theme" on the left panel

Select "Adwaita-X-dark" for both "Gtk+ Theme" and "Current theme"

### Install "Ambiance-Orange" Theme

This is the theme from Ubuntu with Unity

Double click the ambiance-colors.deb

Ubuntu Software Center will install it

Open Tweak-Tool (`gnome-tweak-tool`), go to "Theme" on the left panel

Select "Adwaita" for the Gtk+ Theme and "Ambiance-Orange" for Current theme

### Show date in top bar

	gsettings set org.gnome.shell.clock show-date true
	gsettings set org.gnome.shell.clock show-seconds true

Alternatively, open tweak-tool and go to "Shell", and switch both "Show date in clock" and "Show time with seconds" to "ON".

### Add minimize button in Gnome 3
	
	gsettings set org.gnome.shell.overrides button-layout ':minimize,maximize,close'

If you want the group on the left side, do this instead:

	gsettings set org.gnome.shell.overrides button-layout 'close,minimize,maximize:'

Alternatively open Tweak-Tool (`gnome-tweak-tool`), go to Shell, and select "All" from "Arrangement of buttons in title bar"

### Install extensions for extra usability

Install dependencies first

	sudo apt-get install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0

Go to these sites at extensions.gnome.org, and switch button to "ON":
	
	https://extensions.gnome.org/extension/5/alternative-status-menu/
	https://extensions.gnome.org/extension/120/system-monitor/
	https://extensions.gnome.org/extension/97/coverflow-alt-tab/
	https://extensions.gnome.org/extension/112/remove-accesibility/

System monitor will move the clock, so to get the clock back into the middle,

Click on the system monitor and go to "Preferences..."

Then uncheck the "Move the clock" checkbox

Pres Alt-F2 and enter `r` and press enter. This refreshes Gnome.

### Add "Open in Terminal" as a right-click option:
	
	sudo apt-get install nautilus-open-terminal

### Convert text file to Windows (so return carriages aren't messed up)
	
	unix2dos sourcefile destinationfile

### Convert text file from Windows to Linux (so return carriages aren't messed up)
	
	dos2unix sourcefile destinationfile

### Install compiler and other dev tools:
	
	sudo apt-get install gcc build-essential dkms git-core

### Install Chinese input method
	
	sudo apt-get install ibus-googlepinyin

### Install support for rar and 7z
	
	sudo apt-get install unrar
	sudo apt-get install p7zip p7zip-plugins

### Install exFAT file system support

	sudo apt-get install exfat-fuse

### Install image editor
	
	sudo apt-get install gimp

### Finding stuff

To find files, use

	sudo find [directory to look in] -iname [name of file you're looking for]

Ex: `sudo find / -iname firefox`

This will look in root for the file "firefox". the `-iname` option tells system that the name is case insensitive, whereas `-name` option will be case sensitive.

### Removing repository
	
	sudo add-apt-repository --remove ppa:whatever/ppa

### Copying/Transferring files and check integrity

Note that `/source/files` is different from `/source/files/`. If you use `/sounce/files/`, `rsync` will copy just files from instead of the folder along with files inside

	rsync -avz --progress /path/of/files /desired/destination/

Then check for integrity adding the `-n` option, which is doing a dry run of transfer. This provides a list of files that need to be retransferred.

	rsync -avzn /path/of/files /desired/destination/

If transferred everything correctly, there shouldn't be any files listed

### Fix a corrupted file system

If system is corrupted, obtain a Fedora live usb image and start into the live system. Open a terminal and do these commands:

	lsblk # this lists the partitions. decide which one's corrupted.
	su
	fsck -My /dev/sda3 # could be /dev/sdb5 or something else

`-M` option is used so that `fsck` exits if operating on mounted disk

`-y` option says yes to all questions asking if you want to fix errors

This ought to fix the partition. Reboot and try it.

### In case you are not added to sudoers list

	su

Enter password

	visudo

Press Enter to continue

Type capital `G` to go down to very bottom

Type `o` to open new line or i to insert

Notice it says 
	
	## Allow root to run any commands anywhere
	root    ALL=(ALL)       ALL     ]
	
This allows root to do anything.

So, to make yourself a root user type this at the bottom where you opened new line:

	jchan    ALL=(root)  ALL

Remember to use tabs instead of spaces

Press ESC key

To exit and save changes, type in:
	
	:wq

If you screw up on anything after editing visudo and pressing ESC, type this in:

	:q!

This exits and discard changes.

### Add application to Gnome 3 application launcher

Sometimes you install an application like Eclipse, and it isn't added to the application launcher. Add it this way:
	
	cd /usr/share/applications
	
Create a new .desktop file with these fields:

	Name: Application name in the application launcher. Ex: Intellij’ IDEA
	Comment: Comment explaining the purpose of the application
	Exec: The path to the executable of your application
	Terminal: If you want your application to be executed in a shell, set this value to true; false otherwise
	Type: Application
	Categories: The categories this application belongs to, separated by a semicolon. For Intellij’IDEA, I set this value to: Development; IDE; JAVA
	StartupNotify: Whether or not a notification should be shown when the application has finished launching. These notifications are displayed in the bottom of screen
	Icon: Icon file name without the file extension. The icon has to be copied in /usr/share/icons.

To see an example, look at `eclipse.desktop`