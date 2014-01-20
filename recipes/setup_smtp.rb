#
# Cookbook Name:: sendmail
# Recipe:: setup_smtp
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{
  sendmail sendmail-cf make
}.each do |package_name|
  package "#{package_name}" do
    action :install
  end
end


template "/etc/mail/local-host-names" do
        source "local-host-names.erb"
        owner "root"
        group "root"
        mode 0644
end


cookbook_file "/etc/mail/sendmail.mc" do
  source "sendmail.mc"
  mode "0644"
  notifies :run, "script[sendmail_restart]", :immediately
end


script "sendmail_restart" do
  interpreter "bash"
  user "root"
  cwd "/etc/mail"
  code <<-EOH
    make sendmail.cf
    make restart
  EOH
  action :nothing
end
