name             "designer"
maintainer       "Opscode, Inc."
maintainer_email "mkchendil@gmail.com"
license          "Apache 2.0"
description      "Installs NetIQ Designer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"


# %w{ debian ubuntu centos redhat fedora }.each do |os|
  # supports os
# end

recipe "designer::default", "Installs NetIQ Designer"

