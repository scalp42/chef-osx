# Chef repository for various OSX related items

# History

#### 0.0.1 (master)

attributes

    node[:user] # the user you were before SUDO
    node[:home] # /Users/youruser/
    node[:library] # /Users/youruser/Library

launchctl definition

    launchctl "/System/Library/LaunchDaemons/com.apple.locate.plist" do
      not_if "launchctl list | grep locate"
      action :load
      user "root"
    end

plist definition

    plist "com.apple.Safari" do
      key "IncludeDevelopMenu"
      value 1
      user node[:user]
    end 

homebrew LWRP

    homebrew "mysql" do
      not_if "test -e /usr/local/bin/mysql"
      action [:install, :uninstall, :upgrade]
    end

# License

MIT licensed

Copyright (C) 2011 Michael Schubert, http://schubert.cx