# Encoding: utf-8
#
# Cookbook Name:: gitlab-omnibus
# Recipe:: install_pki
#
# Copyright 2014, Chris Fordham
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
#

require 'uri'

template "/etc/gitlab/ssl/#{URI(node['gitlab-omnibus']['external_url']).host}-cert.pem" do
  source 'ssl_cert.erb'
  variables(
    cert_content: node['gitlab-omnibus']['ssl']['certificate']
  )
  mode 0400
  notifies :run, 'execute[gitlab-ctl reconfigure]', :delayed
  only_if { node['gitlab-omnibus']['enable_tls'] }
end

template "/etc/gitlab/ssl/#{URI(node['gitlab-omnibus']['external_url']).host}-key.pem" do
  source 'ssl_key.erb'
  variables(
    key_content: node['gitlab-omnibus']['ssl']['certificate_key']
  )
  mode 0400
  notifies :run, 'execute[gitlab-ctl reconfigure]', :delayed
  only_if { node['gitlab-omnibus']['enable_tls'] }
end
