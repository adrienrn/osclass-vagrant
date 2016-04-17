
# osclass-vagrant

Set up an Osclass stack for development in a few steps.

## Overview

Using [Vagrant](https://www.vagrantup.com/) and [Puppet](https://www.puppet.com/), this will set up a virtual machine to develop your wbesite on Osclass.

It includes :

- **Apache:** HTTP server, with a configured `osclass.dev` vhost.
- **PHP:** configured with required extensions to make it work with Osclass.
- **MySQL:** database with default database structure.
- **PhpMyAdmin & Adminer:** to easily manage your database.

It also includes some useful development tools like: Git, Composer, Bower, Grunt... and more!

| -              | URL                            | User    | Password  | Comments |
| :------------- | :-------------                 | :-----  | :-------- | :------- |
| Osclass        | http://osclass.dev/oc-admin/   | admin   | admin     | Use /oc-admin/ |
| MySQL          | http://osclass.dev/phpmyadmin/<br />http://osclass.dev/adminer/ | hello   | hello     | For CLI access, `root` has no password by default. |
| SSH            | `vagrant ssh`                  | vagrant | vagrant   | vagrant user is sudoers, use `sudo` to make root actions. |

---

> Thanks to [michaltakac/osclass-vagrant](http://github.com/michaltakac/osclass-vagrant) for getting the idea in route and put up all the ground work.

## Getting started

### Prerequisities

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/) or equivalent virtualization tool like Parallels Desktop

### 1. Clone this repository

On your computer:

```
git clone https://github.com/adrienrn/osclass-vagrant.git
```

Inside the new folder, init some things:

```
./init.sh
```

### 2. Create the virtual machine

Still in the same repository:

```
vagrant up
```

The first time, this will create the virtual machine and install all the necessary things. The next time you do it, it will only boot up the virtual machine.

### 3. Connect & Enjoy!

You can connect to your virtual machine using SSH:

```
vagrant ssh
```

Then, edit your `/etc/hosts` file and add this line:

```
192.168.10.82   osclass.dev
```

You can the connect to Osclass at `http://osclass.dev/`.

---
