#
# Cookbook Name:: designer
# Recipe:: default
#
# Copyright 2013, NetIQ
#
# All rights reserved - Do Not Redistribute
#

designer_install_loc=node['designer']['designer_install_loc']
designer_locale=node['designer']['designer_locale']
designer_build_loc=node['designer']['designer_build_loc']
jre_loc=node['designer']['jre_loc']



template "/tmp/designer_install.properties" do
  source "designer_install.properties.erb"
  owner "root" 
  mode "0644"  
end

execute "Install Desginer" do
  command " \"#{designer_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -i silent -f \"/tmp/designer_install.properties\" "
  creates "/opt/novell/idm/Designer/Designer"
  not_if { ::File.exists?("/opt/novell/idm/Designer/Designer")}
  action :run
end





