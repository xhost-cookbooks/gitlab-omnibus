default['gitlab-omnibus']['package']['download_url'] = 'https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.5.3-omnibus.5.2.1.ci-1_amd64.deb'
default['gitlab-omnibus']['package']['checksum'] = 'c00a73664aa197f78a4df887fd020ea686e299d3cb0ea24f25dcc18fea971902'
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
