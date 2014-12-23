# Encoding: utf-8

name             'gitlab-omnibus'
maintainer       'Chris Fordham'
maintainer_email 'chris@fordham-nagy.id.au'
license          'Apache 2.0'
description      'Installs/Configures gitlab-omnibus'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'gitlab-omnibus::default',        'Configures and installs GitLab.'
recipe 'gitlab-omnibus::install',        'Installs GitLab omnibus package.'
recipe 'gitlab-omnibus::configure',      'Configures GitLab omnibus configuration file.'
recipe 'gitlab-omnibus::reconfigure',    'Re-configures GitLab.'
recipe 'gitlab-omnibus::print_config',   'Prints (logs) the gitlab.rb configuration.'

attribute 'gitlab-omnibus/package/download_url',
          display_name: 'GitLab Omnibus Package URL',
          description: 'URL to fetch the GitLab Omnibus package from.',
          default: 'https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.5.3-omnibus.5.2.1.ci-1_amd64.deb',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install']

attribute 'gitlab-omnibus/package/checksum',
          display_name: 'GitLab Omnibus Package Checksum',
          description: 'The SHA256 checksum of the GitLab Omnibus package.',
          default: 'c00a73664aa197f78a4df887fd020ea686e299d3cb0ea24f25dcc18fea971902',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install']

attribute 'gitlab-omnibus/external_url',
          display_name: 'GitLab Omnibus External URL',
          description: 'The external or public URL of the GitLab web interface.',
          default: 'http://gitlab.example.com/',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/enable_tls',
          display_name: 'GitLab Omnibus Enable TLS',
          description: 'Whether to enable TLS (SSL) support.',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/nginx/redirect_http_to_https',
          display_name: 'GitLab Omnibus Redirect HTTP->HTTPS',
          description: 'Whether to redirect HTTP requests to HTTPS.',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/nginx/ssl_certificate',
          display_name: 'GitLab Omnibus SSL Certificate',
          description: 'The x509 (pem) TLS/SSL certificate.',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/nginx/ssl_certficiate_key',
          display_name: 'GitLab Omnibus SSL Certificate Key',
          description: "The x509 (pem) TLS/SSL certificate's key.",
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/rails/ldap_enabled',
          display_name: 'GitLab Omnibus LDAP Enabled',
          description: 'Whether to enable LDAP with GitLab.',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/rails/gitlab_email_from',
          display_name: 'GitLab Omnibus Email From',
          description: 'The email address mail is sent From: for GitLab.',
          default: 'gitlab@example.com',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/rails/ldap_group_base',
          display_name: 'GitLab Omnibus LDAP Group Base',
          description: 'The LDAP group base.',
          default: '',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/rails/ldap_user_filter',
          display_name: 'GitLab Omnibus LDAP User Filter',
          description: 'The LDAP user filter.',
          default: '',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']

attribute 'gitlab-omnibus/rails/ldap_servers_yaml',
          display_name: 'GitLab Omnibus LDAP Servers',
          description: 'The LDAP servers provided in YAML format.',
          recipes: ['gitlab-omnibus::default', 'gitlab-omnibus::install', 'gitlab-omnibus::configure']
