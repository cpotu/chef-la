#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['platform_family'] == "rhel"
	package = "httpd"
elsif node['platform_family'] == "debian"
	package = "apache2"
end

package 'apache2' do
	package_name package
	action :install
end

service 'httpd' do
	action [:enable, :start]
end

ipaddress = node['ipaddress']

file 'var/www/html/index.html' do
	content "Hello World! Node IP Address is:  #{ipaddress} ----------------------------------"
end

hostname = node['hostname']

execute 'index-file' do
	command "echo  hostname is: #{hostname} >> /var/www/html/index.html"
	only_if 'test -r /var/www/html/index.html'
end
