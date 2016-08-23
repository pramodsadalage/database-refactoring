# SETUP VAGRANT BOX WITH ORACLE DATABASE FOR TUTORIAL

**This setup assumes you are using a 64-bit machine capable of running a 64-bit VM**
**This is purely provided as a guidance, if you want to install a VM or run oracle DB on your host machine thats fine too**

## Installation & Setup

> **IMPORTANT: Vagrant setup will fail if your copy of source has CRLF (Windows-style) line terminators**
>
> Git Solution:
>
>   1. `git config --global core.autocrlf false`
>
>   2. `git config --global core.eol lf`
>

### Cygwin (alternative command line tool if using windows)

* Install [Cygwin](https://www.cygwin.com/)
* When running the installer, make sure you include rsync and openssh tools.

### <a name="vagrant-developer-box-setup"></a>Vagrant (Local Database VM) Setup

* Install [Vagrant](https://www.vagrantup.com/)
* Install [Virtualbox](https://www.virtualbox.org/)
* `vagrant plugin install vagrant-vbguest`
* Make sure the RPMs for Oracle XE, Instant Client Basic, and Instant Client SDK are in
(HOME_FOLDER)/puppet/modules/oracle/files
  * Oracle XE: [oracle-xe-11.2.0-1.0.x86_64](http://download.oracle.com/otn/linux/oracle11g/xe/oracle-xe-11.2.0-1.0.x86_64.rpm.zip)
  * Instant Client Basic: [oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html)
  * Instant Client SDK: [oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html)
  * Note: Vagrant will install all software and dependencies required on the VM. The only exception is the Oracle database setup (see [Oracle Setup](#oracle-setup))
* `vagrant up` from (HOME FOLDER). This command will bring up VM and automatically run Puppet to install dependencies.
* This step may throw errors about swap space, just run `vagrant provision` and it should work

### <a name="oracle-setup"></a>Oracle (Database) Setup

* `vagrant ssh` to ssh into local VM
* `sudo /etc/init.d/oracle-xe configure`
* Accept all the defaults
* suggested password : `refacTor1`
* now run `. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh`
* `sqlplus system/refacTor1` will give you access to the database
* Optional steps
  * `create user "username" identified by "some-good-password"`
  * `grant create session, dba to "username"`


### Dependencies

* **This is on your host machine and not the VM, to be installed manually**
* Latest version of the JDK
* ANT latest version
* SQL Developer a tool to query the database [SQL Developer](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html)
