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





