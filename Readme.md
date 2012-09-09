Setup
=====
1. Setup Vagrant:  See `http://vagrantup.com` for details.
2. Clone this repo: `git clone https://github.com/nhuff/codepeople_sep2012_puppet.git`
3. Change to whatever directory you cloned the repo to.
4. Updated submodules: `git submodule update --init`
5. Start the VMs: `vagrant up`

Result
======
Structure
---------

You should have a directory with the following files and directories.
* Vagrantfile: Vagrants config file
* Readme.md: What you are reading right now
* manifests/: Puppet manifests that the VM's run
* modules/: Puppet modules that the VM's manifests use
* db/: Contains sql file for db2 vm to import at database creation
* web/: Includes web content for demo2 to serve

VMs
---
You should end up with two vms db2 and demo2.  You can log into them by running 
`vagrant ssh db2` and `vagrant ssh demo2`.  The webserver forwards its http port
to port `8899` on localhost so you should be able to open a browser and go to
`http://localhost:8899` and get a 'Hi there.'.  You can also go to 
`http://localhost:8899/phpinfo.php` to get the php install info and
`http://localhost:8899/list.php` access a small php program that loads data from
a database.
