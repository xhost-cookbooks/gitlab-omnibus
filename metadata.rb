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

attribute 'gitlab-omnibus/package/download_url',
          display_name: 'GitLab Omnibus Package URL',
          description: 'URL to fetch the GitLab Omnibus package from.',
          default: 'https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.5.3-omnibus.5.2.1.ci-1_amd64.deb',
          recipes: ['roundcube::default', 'roundcube::install']

attribute 'gitlab-omnibus/package/checksum',
          display_name: 'GitLab Omnibus Package Checksum',
          description: 'The SHA256 checksume of the GitLab Omnibus package.',
          default: 'c00a73664aa197f78a4df887fd020ea686e299d3cb0ea24f25dcc18fea971902',
          recipes: ['roundcube::default', 'roundcube::install']
