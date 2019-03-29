#!/bin/bash

# ./wrlinux-x/setup.sh --machines qemux86-64

if [ "--machines" = "$1" ] ; then
	cat <<EOF_CONFIG
The End User License Agreement is available at:
	/opt/wcoyote/lts-18/wrlinux-x/EULA

I have read the EULA and accept it - yes/no/read yes

Initialized empty Git repository in /home/wcoyote/lts-18/bin/buildtools.git/.git/
Searching for buildtools-standalone-20181115...
Username for 'https://windshare.windriver.com': wcoyote
Password for 'https://wile_e_coyote@acme.com': 
Fetching buildtools..
remote: Counting objects: 6, done.
remote: Total 6 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (6/6), done.
From https://windshare.windriver.com/remote.php/gitsmart/WRLinux-lts-18-Core/buildtools-standalone-20181115
 * [new branch]      WRLINUX_10_18_LTS -> buildtools-standalone-20181115
Switched to branch 'buildtools-standalone-20181115'
Done
Installing buildtools..
Build tools installer version 10.18.44
======================================
You are about to install the SDK to "/opt/wcoyote/lts-18/bin/buildtools.buildtools-standalone-20181115". Proceed[Y/n]? Y
Extracting SDK............done
Setting it up...done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /opt/wcoyote/lts-18/bin/buildtools.buildtools-standalone-20181115/environment-setup-x86_64-wrlinuxsdk-linux
Done
Searching for git-repo...
Detected Windshare configuration.  Processing entitlements and indexes.
Loading the mirror index from https://windshare.windriver.com/remote.php/gitsmart/WRLinux-lts-18-BSP-intel-socfpga/mirror-index (WRLINUX_10_18_LTS)...
Loading the mirror index from https://windshare.windriver.com/remote.php/gitsmart/WRLinux-lts-18-BSP-nxp-ls20xx/mirror-index (WRLINUX_10_18_LTS)...
Loading the mirror index from https://windshare.windriver.com/remote.php/gitsmart/WRLinux-lts-18-Core/mirror-index (WRLINUX_10_18_LTS)...
Using index Wind River Developer Layer Index from the mirror index...
Setting distro to "wrlinux-small"
Setting machine to "qemux86-64"
Adding existing repo at 'wrlinux-x' to the index
Updated project configuration
[master (root-commit) 89b850d] Configuration change - --machines qemux86-64
20 files changed, 690 insertions(+)
create mode 100644 .gitconfig
create mode 100644 .gitignore
create mode 100644 .gitmodules
create mode 100644 .templateconf
create mode 100644 README
create mode 100644 config/bblayers.conf.sample
create mode 100644 config/conf-notes.txt
create mode 100644 config/local.conf.sample
create mode 100644 config/log/2019-03-29-08:28:05+0000.log
create mode 100644 config/saved_base_branch
create mode 100644 config/site.conf.sample
create mode 100644 default.xml
create mode 100644 layers/local/README
create mode 100644 layers/local/classes/.keepme
create mode 100644 layers/local/conf/layer.conf
create mode 100644 layers/local/downloads/.keepme
create mode 100644 layers/local/git/.keepme
create mode 100644 layers/local/recipes-sample/hello/hello/hello.c
create mode 100644 layers/local/recipes-sample/hello/hello_1.0.bb
create mode 160000 wrlinux-x

Your identity is: Wile E. Coyote <wile_e_coyote@acme.com>
If you want to change this, please re-run 'repo init' with --config-name

repo has been initialized in /opt/wcoyote/lts-18
Fetching projects: 100% (14/14), done.  
Checking out files: 100% (4065/4065), done.
Checking out files: 100% (259/259), done.out files:  78% (204/259)   
Checking out files: 100% (245/245), done.out files:  91% (223/245)   
Checking out files: 100% (309/309), done.out files:  13% (43/309)   
Checking out files: 100% (4470/4470), done.t files:  15% (705/4470)   
Checking out files: 100% (1069/1069), done.ut files:  10% (107/1069)   
Syncing work tree: 100% (14/14), done.  

Starting anspass...
Storing credentials into anspass.
Stopping anspass...
EOF_CONFIG

else

cat <<EOF_HELP
INFO: usage: setup.py [-h] [-v] [--base-url URL] [--base-branch BRANCH] [--mirror]
                [--buildtools-branch BRANCH] [--user USER]
                [--password PASSWORD] [--accept-eula ACCEPT] [--no-anspass]
                [-rv] [-rj JOBS] [--repo-depth DEPTH] [--repo-force-sync]
                [--list-distros [all]] [--list-machines [all]] [--list-layers]
                [--list-recipes] [--list-templates [all]]
                [--distros DISTRO [DISTRO ...]]
                [--machines MACHINE [MACHINE ...]]
                [--layers LAYER [LAYER ...]] [--recipes RECIPE [RECIPE ...]]
                [--all-layers] [--no-recommend]
                [--templates TEMPLATE [TEMPLATE ...]] [--dl-layers]

setup.py: Application to fetch & setup a distribution project.

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Set the verbosity to debug
  --mirror              Do not construct a project, instead construct a mirror
                        of the repositories that would have been used to
                        construct a project (requires a Layer Selection
                        argument)

Base Settings:
  --base-url URL        URL to fetch from (default
                        https://windshare.windriver.com/remote.php/gitsmart
                        /WRLinux-lts-18-Core)
  --base-branch BRANCH  Base branch identifier (default WRLINUX_10_18_LTS)
  --buildtools-branch BRANCH
                        Buildtools branch (default WRLINUX_10_18_LTS)
  --user USER           Specify default user for download
  --password PASSWORD   Specify default password for download
  --accept-eula ACCEPT  Accept End User License Agreement (yes|no)
  --no-anspass          Do not use anspass to save the user name and password

repo Settings:
  -rv, --repo-verbose   Disables use of --quiet with repo commands
  -rj JOBS, --repo-jobs JOBS
                        Sets repo project to fetch simultaneously (default 4)
  --repo-depth DEPTH    Sets repo --depth; see repo init --help (note: if set,
                        a value of >= 2 is required)
  --repo-force-sync     Sets repo --force-sync; see repo sync --help

Layer Listings:
  --list-distros [all]  List available distro values
  --list-machines [all]
                        List available machine values
  --list-layers         List all available layers
  --list-recipes        List all available recipes
  --list-templates [all]
                        List available templates

Layer Selection:
  --distros DISTRO [DISTRO ...]
                        Select layer(s) based on required distribution and set
                        the default DISTRO= value (default wrlinux-small)
  --machines MACHINE [MACHINE ...]
                        Select layer(s) based on required machine(s) and set
                        the default MACHINE= value (default qemux86-64)
  --layers LAYER [LAYER ...]
                        Select layer(s) to include in the project and add to
                        the default bblayers.conf
  --recipes RECIPE [RECIPE ...]
                        Select layers(s) based on recipe(s)
  --all-layers          Select all available layers
  --no-recommend        Disable recommended layers during layer resolution
  --templates TEMPLATE [TEMPLATE ...]
                        Select layers(s) based on template(s) and add them by
                        default to the builds
  --dl-layers           Enable download layers; these layers include
                        predownloaded items

EOF_HELP

fi

