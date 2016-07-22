#
# Cookbook Name:: mysql-install
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Setup MySQL with desired database
mysql_service 'mysql' do
  version node['mysql-install']['version']
  bind_address node['mysql-install']['bind_address']
  port node['mysql-install']['port']
  initial_root_password node['mysql-install']['password']
  action [:create, :start]
end
