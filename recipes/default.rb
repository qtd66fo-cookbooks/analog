#
# Cookbook:: analog
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
case node[:platform]
when "centos"
  platform_version = node[:platform_version].to_f

  if platform_version >= 6.0 then
    rpmfile = "analog-6.0-8-mdv2012.0.x86_64.rpm"
  elsif platform_version >= 5.0 then
    rpmfile = "analog-6.0.4-1.el5.i386.rpm"
  else
    raise "This recipe can not be applied to this environment!!"
  end

  remote_file "#{Chef::Config[:file_cache_path]}/#{rpmfile}" do
    source "https://www.rpmfind.net/linux/Mandriva/devel/cooker/x86_64/media/contrib/release/#{rpmfile}"
  end

  %w[gd perl perl-CGI].each do |pkg|
  	package pkg do
  	  action :install
  	end
  end

  package "analog" do
    action :install
    source "#{Chef::Config[:file_cache_path]}/#{rpmfile}"
    provider Chef::Provider::Package::Rpm
  end
end
