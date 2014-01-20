name             'sendmail'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures sendmail'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "centos"

# == Recipes
#

recipe "sendmail::setup_smtp",
  "Install and setup smtp server"

# == Attributes
#
attribute "sendmail",
  :display_name => "General sendmail Options",
  :type => "hash"

attribute "sendmail/localhostname",
  :display_name => "local-host-names",
  :description =>
    "Accept from Mail Address Configuration",
  :required => "required",
  :recipes => ["sendmail::setup_smpt"]
