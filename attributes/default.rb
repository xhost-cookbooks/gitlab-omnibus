default['gitlab-omnibus']['package']['download_url'] = 'https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.6.1-omnibus.5.3.0.ci-1_amd64.deb'
default['gitlab-omnibus']['package']['checksum'] = '9253a7b2ca194c4e0851ecfb51bcf050c3183750b30374348c280f72a7556522'
default['gitlab-omnibus']['package']['download_to'] = "#{Chef::Config[:file_cache_path]}/#{File.basename(node['gitlab-omnibus']['package']['download_url'])}"

default['gitlab-omnibus']['enable_tls'] = false

# gitlab.rb configuration directives
default['gitlab-omnibus']['external_url'] = 'https://gitlab.example.com'
default['gitlab-omnibus']['redirect_http_to_https'] = false

# ssl cert/key
default['gitlab-omnibus']['ssl']['certificate'] = nil
default['gitlab-omnibus']['ssl']['certificate_key'] = nil

default['gitlab-omnibus']['rails']['gitlab_https'] = false
default['gitlab-omnibus']['rails']['gitlab_port'] = 80
default['gitlab-omnibus']['rails']['ldap_enabled'] = false
default['gitlab-omnibus']['rails']['gitlab_email_from'] = 'gitlab@example.com'

# GitLab Enterprise Edition only
default['gitlab-omnibus']['rails']['ldap_group_base'] = ''
default['gitlab-omnibus']['rails']['ldap_user_filter'] = ''
default['gitlab-omnibus']['rails']['ldap_servers_yaml'] = nil
