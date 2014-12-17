default['gitlab-omnibus']['package']['download_url'] = 'https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.5.3-omnibus.5.2.1.ci-1_amd64.deb'
default['gitlab-omnibus']['package']['checksum'] = 'c00a73664aa197f78a4df887fd020ea686e299d3cb0ea24f25dcc18fea971902'
default['gitlab-omnibus']['package']['download_to'] = "#{Chef::Config[:file_cache_path]}/#{File.basename(node['gitlab-omnibus']['package']['download_url'])}"

default['gitlab-omnibus']['external_url'] = 'https://gitlab.example.com'

default['gitlab-omnibus']['nginx']['redirect_http_to_https'] = true
