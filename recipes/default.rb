#
# Cookbook Name:: mysql-install
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


case node['platform_family']
  when 'debian'
    apt_update 'apt update' do
      action :update
    end
end

# Setup MySQL with desired database
mysql_service 'mysql' do
  version node['mysql-install']['version']
  bind_address node['mysql-install']['bind_address']
  port node['mysql-install']['port']
  initial_root_password node['mysql-install']['password']
  action [:create, :start]
end
 
if node['platform_family'] == 'debian'

# create mysql directory 
directory '/etc/mysql' do
  action :create
end

# copy conf file of mysql
execute 'copy-config-data' do
  command 'cp -r /etc/mysql-mysql/* /etc/mysql/'
end


# change persmission mysql 
execute 'change-owner' do
  command 'chown  root:root -R  /etc/mysql/'
end

service "mysql" do
  action :restart
end

# database creation
execute "create db #{node['mysql-install']['dbname']}" do
    command "sudo mysql -uroot -p#{node['mysql-install']['password']} -e \"create database #{node['mysql-install']['dbname']}\""
end
end


 
 

