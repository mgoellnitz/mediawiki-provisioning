# Playbook to prepare a small MediaWiki Host

`mediawiki-provisioning`

The [Ansible][ansible] playbook in this repository is intended for preparation
of a lean and simple MediaWiki without any other installation steps necessary.

The supported target operating system is Debian as prepared with a reasonable
default installation for `ssh-server` and all other options deselected. (See
preseed-file in this repository as an example.)

Find mirrors of this repository at [gitlab][gitlab] and [github][github].


## Preparation

Configure relevant hosts in `inventory.properties` or your global
[Ansible][ansible] hosts file (if you haven't done so).

Be sure to have your ssh public key installed for the intended login user and
this user may become root on the remote side.

As a second step create a copy of the `sites/demo` folder and change the file
`configuration.yml` as needed. Add and configure a logo and favicon. Also a
copy of a MediaWiki database file might be presented here, if you don't want to
start with the empty content set provided.


## Setup of the Environment

We rely on the role `mediawiki` for all coremedia hosts.


## Usage

Run with:

```
ansible-playbook -i inventory.properties setup.yml
```

or for any non-demo site

```
ansible-playbook -e site_name=mysite -i inventory.properties setup.yml
```

The only user present after installation of the provided database is `demo`
with a password `demopassword` and a mail address of `demo@my.domain`.


## Collection

This playbook provides:

* MySQL
* PHP
* Apache httpd
* MediaWiki

for hosts in role `mediawiki`.


## Feedback

Please use the [issues][issues] section of this repository at [github][github]
for feedback.

Repository Image:
[Ratfink1973@Pixabay](https://pixabay.com/de/photos/garten-gie%C3%9Fkanne-natur-gr%C3%BCn-gie%C3%9Fen-2497476/)

[issues]: https://github.com/mgoellnitz/mediawiki-provisioning/issues
[ansible]: https://www.ansible.com/
[github]: https://github.com/mgoellnitz/mediawiki-provisioning
[gitlab]: https://gitlab.com/backendzeit/mediawiki-provisioning
