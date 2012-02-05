define :launchctl, :action => :load do
  default_action = "load"
  action = params[:action].to_s || default_action
  plist_file = params[:name]
  verify_block = params[:verify_block] || lambda { true }
  raise "Unknown action #{action}" unless ["load", "unload"].include?(action)

  options = ""
  options << "-w" if File.exist?(params[:name])

  execute "launchctl-#{action}-#{plist_file}" do
    only_if params[:only_if] if params[:only_if]
    not_if params[:not_if] if params[:not_if]
    command "launchctl #{action} #{options} #{params[:name]}"
    user params[:user] if params[:user]
  end
  
  ruby_block "verify-launchctl-#{action}-#{plist_file}" do
    block do
      verify_block.call
    end
  end
end