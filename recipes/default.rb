#
# Author:: Kyle Evans (<kylebe@gmail.com)
# Cookbook Name:: kbe_ssh
# Recipe:: default
# Copyright Holder:: Kyle Evans
# Copyright Holder Email:: kylebe@gmail.com
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'openssh-server'
package 'openssh-client'

template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  owner 'root'
  group 'root'
  mode '0644'
    notifies :restart, 'service[sshd]', :immediately
end

service 'sshd' do
  supports :restart => true, :reload => true, :stop => true, :status => true, :start =>true
  action [:enable, :start]
end
