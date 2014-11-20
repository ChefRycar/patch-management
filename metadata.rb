name             'patch-management'
maintainer       'Chef Software, Inc'
maintainer_email 'support@getchef.com'
license          'Apache 2.0'
description      'Installs/Configures patch-management'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'ohai', '~> 2.0'	

%w{centos debian fedora redhat scientific ubuntu }.each do |os|
  supports os
end
