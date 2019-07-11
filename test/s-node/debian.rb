
group "S-NODE: Debian" do

  puts "[S-NODE] Debian..."

  dir = "s-node/debian"
  goto :localhost, :exec => "cd #{dir} && vagrant up"

  target "vagrant status"
  goto :localhost, :exec => "cd #{dir} && vagrant status"
  expect [ "teuton-s-node-debian", "running" ]

  target "uname -a"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"uname -a\""
  expect [ "Debian", "s-node" ]

  goto :localhost, :exec => "cd #{dir} && vagrant halt"
  goto :localhost, :exec => "cd #{dir} && vagrant destroy --force"
end
