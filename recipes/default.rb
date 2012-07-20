package_url = node['riak']['package']['url']
package_file = package_url.split("/").last

directory "/tmp/riak_pkg" do
  owner "root"
  mode 0755
  action :create
end

remote_file "/tmp/riak_pkg/#{package_file}" do
  source package_url
  owner "root"
  mode 0644
  not_if { File.exists?("/tmp/riak_pkg/#{package_file}") }
end

dpkg_package "riak" do
  source "/tmp/riak_pkg/#{package_file}"
  action :install
end

file "/etc/riak/app.config" do
  content Eth::Config.new(node['riak']['config'].to_hash).pp
  owner "root"
  mode 0644
end

file "/etc/riak/vm.args" do
  content Eth::Args.new(node['riak']['args'].to_hash).pp
  owner "root"
  mode 0644
end

service "riak" do
  supports :start => true, :stop => true, :restart => true
  action [:enable]
  subscribes :restart, 
    resources(:file => ["/etc/riak/app.config", "/etc/riak/vm.args"])
end
