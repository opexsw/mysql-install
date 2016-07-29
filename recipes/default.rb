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
 
# change persmission mysql 
execute 'change-owner' do
  command 'chown -r root:root /run/mysql-mysql/'
end

 

