actions :install, :uninstall, :upgrade

attribute :action, :default => :install
attribute :head, :default => false, :equal_to => [true, false]
attribute :user, :kind_of => String
