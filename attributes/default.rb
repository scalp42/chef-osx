default[:user] = ENV["SUDO_USER"] || `id -u -n 501`.strip
default[:home] = "/Users/#{node[:user]}"
default[:library] = "#{node[:home]}/Library"
default[:applications][:dir] = "/Applications"