# Encoding: utf-8
#
# Cookbook Name:: gitlab-omnibus
# Recipe:: install
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

execute 'gitlab-ctl reconfigure' do
  action :nothing
end

remote_file node['gitlab-omnibus']['package']['download_to'] do
  source node['gitlab-omnibus']['package']['download_url']
  checksum node['gitlab-omnibus']['package']['checksum']
  owner 'root'
  group 'root'
  mode '644'
end

dpkg_package 'gitlab_omnibus' do
  source node['gitlab-omnibus']['package']['download_to']
  notifies :run, 'execute[gitlab-ctl reconfigure]'
end
