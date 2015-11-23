# MonitorOne #

A Graphite-, CollectD-, StatsD- based monitoring system framework
for deployed applications and infrastructure.

**NB. YOU MUST `graphite-manage syncdb` _everytime_ you upload the local_settings.py file. Failure to do so will BREAK Django/Graphite**

## Terraform ##

From the `terraform` sub-directory of this project
you can instantiate a StageOne infrastructure with:

```
~:$ terraform apply
```

## Ansible ##

From within the `ansible` sub-directory of this project
you may install all required roles with:

```
~:$ ansible-galaxy install -r requirements.yml
```

## Serverspec ##

Test that a host in the system is provisioned as expected:

```
~:$ bundle exec rake spec:monitor1.ubxd.io
```

---
#### TODO: ####

1.) Track time of deploys, and overlay onto graphs for Cluster
Dashboard. See https://codeascraft.com/2010/12/08/track-every-release/

---
#### FOOTNOTES: ####

##### 1. Graphite Manage Syncdb #####
Right now, the automation is incomplete due to the requirement for performing
`graphite-manage syncdb` interactively. `syncdb` is effectively the Django utility
for providing Schema management  _a la_ Rails' "migrations".

This _can_ be automated, by seeding the action with a JSON file, and calling it with the --no-input flag.
* See https://github.com/jpmens/ansible-graphite/blob/master/graphite.yml
* See https://github.com/jsmartin/ansible-graphite/blob/master/files/Debian/graphite-dump.json
* See https://github.com/jsmartin/ansible-graphite/blob/master/tasks/main.yml
* See http://obfuscurity.com/2012/04/Unhelpful-Graphite-Tip-4
* See https://docs.djangoproject.com/en/dev/howto/initial-data/
* See /usr/lib/python2.7/dist-packages/django/core/management/commands/syncdb.py

##### 2. Graphite Paths #####

* /usr/lib/python2.7/dist-packages/graphite
* /etc/graphite
* /var/lib/graphite
* /var/log/graphite

##### 3. Hadoop Metrics #####

* See https://gist.github.com/gensth/1173492

##### 4. Kibana #####

Your Kibana instance can be accessed at http://elk1.ubxd.io/
Your Kibana HTTP AUTH BASIC login credentials are available in the vault.
