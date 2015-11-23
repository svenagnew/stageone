---
es_apt_repo: 'deb http://packages.elastic.co/elasticsearch/2.x/debian stable main'
es_cluster_name: unboxed
es_node_name: deadpool
es_unicast_hosts: '["elk2.ubxd.io", "elk3.ubxd.io"]'
es_heap_size: 1g

logstash_apt_repo: "deb http://packages.elastic.co/logstash/2.0/debian stable main"

nginx_template_path: etc/nginx/conf.d/kibana.conf.j2
nginx_file_path: /etc/nginx/conf.d/default.conf
