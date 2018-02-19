# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "cpotu"
client_key               "#{current_dir}/cpotu.pem"
chef_server_url          "https://ip-172-31-42-67.ec2.internal/organizations/neworg"
cookbook_path            ["#{current_dir}/../cookbooks"]
