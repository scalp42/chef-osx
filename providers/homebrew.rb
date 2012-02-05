def homebrew_provider(new_resource, action)
  use_head_formula = new_resource.head ? "--HEAD" : ""
  only_if_check = case action
  when "install"
    "brew info #{new_resource.name} | grep 'Not installed'"
  else
    true
  end
  execute "homebrew-#{action}-#{new_resource.name}" do
    only_if only_if_check
    command "brew #{action} #{new_resource.name} #{use_head_formula}"
    user new_resource.user if new_resource.user
  end
end

action :install do
  homebrew_provider(new_resource, "install")
end

action :uninstall do
  homebrew_provider(new_resource, "uninstall")
end

action :upgrade do
  homebrew_provider(new_resource, "upgrade")
end
