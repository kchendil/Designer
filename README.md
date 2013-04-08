Description
===========

Installs Designer shipped with the 402 ISO

Requirements
============

Platform:

* SLES 11 SP2

Attributes
==========

* `node["designer"]["designer_install_loc"]` - The designer install location, default `/opt/novell/idm/Designer/`.
* `node["designer"]["designer_locale"]` - The designer locale to be installed, default `en`.
* `node["designer"]["designer_build_loc"]` - The designer build location, default `/home/vagrant/IDM402AE/test/products/Designer/install`.
* `node["designer"]["jre_loc"]` - The JRE location, default `/root/idm/jre`.

Usage
=====

Managing Tomcat Users
=====================


License and Author
==================

Author:: Chendil Kumar Manoharan(<mkchendil@gmail.com>)

Copyright:: 2010-2012, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
