# Encoding: utf-8
#
# Cookbook Name:: gitlab-omnibus
# Recipe:: configure
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

include_recipe 'gitlab-omnibus::install'
include_recipe 'gitlab-omnibus::install_pki'

template '/etc/gitlab/gitlab.rb' do
  variables(
    external_url: node['gitlab-omnibus']['external_url'],
    enable_tls: node['gitlab-omnibus']['enable_tls'],
    redirect_http_to_https: node['gitlab-omnibus']['redirect_http_to_https'],
    ssl_cert_path: "/etc/gitlab/ssl/#{URI(node['gitlab-omnibus']['external_url']).host}-cert.pem", 
    ssl_key_path: "/etc/gitlab/ssl/#{URI(node['gitlab-omnibus']['external_url']).host}-key.pem",
    gitlab_email_from: node['gitlab-omnibus']['rails']['gitlab_email_from'],
    ldap_enabled: node['gitlab-omnibus']['rails']['ldap_enabled'],
    ldap_group_base: node['gitlab-omnibus']['rails']['ldap_group_base'],
    ldap_user_filter: node['gitlab-omnibus']['rails']['ldap_user_filter'],
    ldap_servers_yaml: node['gitlab-omnibus']['rails']['ldap_servers_yaml']
  )
  mode 0600
  notifies :run, 'execute[gitlab-ctl reconfigure]'
end
