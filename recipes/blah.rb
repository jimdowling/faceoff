#private_ip = my_private_ip()
#public_ip = my_public_ip()

script 'run_experiment' do
  cwd "/home/faceoff"
   user node['faceoff']['user']
  group node['faceoff']['group']
  interpreter "bash"
  code <<-EOM

  EOM
end

