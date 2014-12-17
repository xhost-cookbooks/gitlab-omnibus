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

include_recipe 'gitlab-omnibus::install'

template '/etc/gitlab/gitlab.rb' do
  variables(
    external_url: node['gitlab-omnibus']['external_url'],
    enable_tls: node['gitlab-omnibus']['enable_tls'],
    redirect_http_to_https: node['gitlab-omnibus']['nginx']['redirect_http_to_https'],
    ssl_certificate: node['gitlab-omnibus']['nginx']['ssl_certificate'],
    ssl_key: node['gitlab-omnibus']['nginx']['key'],
    gitlab_email_from: node['gitlab-omnibus']['rails']['gitlab_email_from'],
    ldap_enabled: node['gitlab-omnibus']['rails']['ldap_enabled'],
    ldap_group_base: node['gitlab-omnibus']['rails']['ldap_group_base'],
    ldap_user_filter: node['gitlab-omnibus']['rails']['ldap_user_filter']
  )
  mode 0600
  notifies :run, 'execute[gitlab-ctl reconfigure]'
end
