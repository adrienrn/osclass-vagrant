
# osclass-vagrant

Set up an Osclass stack for development in a few steps.

Using [Vagrant](https://www.vagrantup.com/) and [Puppet](https://www.puppet.com/), this will set up a virtual machine to develop your wbesite on Osclass.

It includes :

- Apache: HTTP server, with a configured `osclass.dev` vhost.
- PHP: configured with required extensions to make it work with Osclass.
- MySQL: database with default database structure.

It also includes some useful development tools like:

- Git
- Composer
- Bower

...and more!

---

> Thanks to [michaltakac/osclass-vagrant](http://github.com/michaltakac/osclass-vagrant) for getting the idea in route and put up all the ground work.

_Please fork it!_

---

# Getting started

### Prerequisities

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/) or equivalent like Parallels Desktop

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
