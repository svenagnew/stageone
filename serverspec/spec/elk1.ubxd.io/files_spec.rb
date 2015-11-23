require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

# Redis Files
describe file("/etc/redis/redis.conf") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
end

# Elasticsearch Files
# packages_elastic_co_elasticsearch_2_x_debian.list
# content => deb http://packages.elastic.co/elasticsearch/2.x/debian stable main
describe file('/etc/elasticsearch/elasticsearch.yml') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /cluster.name: unboxed/ }
  its(:content) { should match /node.name: deadpool/ }
  its(:content) { should match /node.master: true/ }
  its(:content) { should match /node.data: true/ }
  its(:content) { should match /node.max_local_storage_nodes: 1/ }
  its(:content) { should match /index.number_of_shards: 9/ }
  its(:content) { should match /index.number_of_replicas: 2/ }
  its(:content) { should match /path.conf: \/etc\/elasticsearch/ }
  its(:content) { should match /path.data: \/var\/lib\/elasticsearch\// }
  its(:content) { should match /path.logs: \/var\/log\/elasticsearch/ }
  its(:content) { should match /path.plugins: \/usr\/share\/elasticsearch\/plugins/ }
  its(:content) { should match /bootstrap.mlockall: true/ }
  # Figure out how to manage network.publish settings. Crucial to ES.
end

describe file('/etc/init.d/elasticsearch') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_executable }
  its(:content) { should match /NAME=elasticsearch/ }
  its(:content) { should match /DESC="Elasticsearch Server"/ }
  its(:content) { should match /DEFAULT=\/etc\/default\/\$NAME/ }
  its(:content) { should match /DAEMON=\$ES_HOME\/bin\/elasticsearch/ }
end

describe file('/etc/default/elasticsearch') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
  its(:content) { should match /ES_USER=elasticsearch/ }
  its(:content) { should match /ES_GROUP=elasticsearch/ }
  its(:content) { should match /ES_HOME=\/usr\/share\/elasticsearch/ }
  its(:content) { should match /CONF_DIR=\/etc\/elasticsearch/ }
  its(:content) { should_not match /CONF_FILE=\/etc\/elasticsearch\/elasticsearch.yml/ }
  its(:content) { should match /DATA_DIR=\/var\/lib\/elasticsearch\// }
  its(:content) { should match /LOG_DIR=\/var\/log\/elasticsearch/ }
  its(:content) { should match /WORK_DIR=\/tmp\/elasticsearch/ }
  its(:content) { should match /ES_HEAP_SIZE=2g/ }
  its(:content) { should match /MAX_LOCKED_MEMORY=unlimited/ }
  its(:content) { should match /MAX_OPEN_FILES=65535/ }
  its(:content) { should match /MAX_MAP_COUNT=262144/ }
  its(:content) { should match /RESTART_ON_UPGRADE=true/ }
end

# Logstash Files
# packages_elastic_co_logstash_2_0_debian.list
# content => deb http://packages.elastic.co/logstash/2.0/debian stable main
describe file('/etc/init.d/logstash') do
  it { should be_file }
  it { should be_executable }
  it { should be_owned_by 'root' }
  its(:content) { should match /name=logstash/ }
end

describe file('/etc/default/logstash') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
end

describe file('/etc/logstash/conf.d/') do
  it { should be_directory }
end

describe file('/etc/logstash/conf.d/90-elasticsearch-output.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe file('/etc/logstash/conf.d/01-redis-input.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /type \=\> \"redis-input\"/ }
  its(:content) { should match /data_type \=\> \"list\"/ }
end

# Kibana Files
describe file('/usr/local/src/kibana-4.2.1-linux-x64.tar.gz') do
  it { should be_file }
end


describe file('/opt/kibana4/config/kibana.yml') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

# NodeJS Files
# ppa_chris_lea_node_js_trusty.list
# content => deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main

# Nginx Files
# nginx_org_packages_ubuntu.list
# content => deb http://nginx.org/packages/ubuntu/ trusty nginx
describe file('/etc/nginx/conf.d/default.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /listen 80;/ }
  its(:content) { should match /server_name elk1.ubxd.io;/ }
  its(:content) { should match /proxy_pass http:\/\/127.0.0.1:5601;/ }
end
