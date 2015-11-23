
system_services = [
  'cron',
  'elasticsearch',
  'kibana4',
  'logstash',
  'nginx',
  'ssh',
  'sudo'
]

system_services.each do |svce|
  describe service(svce) do
    it { should be_running }
    it { should be_enabled }
  end
end
