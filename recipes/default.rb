#
# Cookbook Name:: designer
# Recipe:: default
#
# Copyright 2013, NetIQ
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

designer_install_loc=node['designer']['designer_install_loc']
designer_build_loc_url=node['designer']['designer_build_loc_url']
designer_locale=node['designer']['designer_locale']
designer_build_loc=node['designer']['designer_build_loc']
jre_loc=node['designer']['jre_loc']
download_build=node['designer']['download_build']

execute "Download Desginer" do
  command " wget #{designer_build_loc_url} -O /tmp/designer_linux.tar.gz"
  creates "/tmp/designer_linux.tar.gz"
  not_if { ::File.exists?("/tmp/designer_linux.tar.gz")}
  action :run
end

execute "Unzip Desginer" do
  command " mkdir -p /home/vagrant/IDM402AE/test/products/Designer/; tar -zxvf /tmp/designer_linux.tar.gz -C /home/vagrant/IDM402AE/test/products/Designer/; mv /home/vagrant/IDM402AE/test/products/Designer/designer_install/* /home/vagrant/IDM402AE/test/products/Designer/"
   creates "/home/vagrant/IDM402AE/test/products/Designer/install"
  not_if { ::File.exists?("/home/vagrant/IDM402AE/test/products/Designer/install")}
  action :run
end

template "/tmp/designer_install.properties" do
  source "designer_install.properties.erb"
  owner "root" 
  mode "0644"  
end

execute "Install Desginer" do
  command " \"#{designer_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -i silent -f \"/tmp/designer_install.properties\" "
   action :run
end





