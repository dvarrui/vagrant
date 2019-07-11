
group "S-NODE: Opensuse" do

  puts "[S-NODE] OpenSUSE..."

  dir = "s-node/opensuse"
  goto :localhost, :exec => "cd #{dir} && vagrant up"

  target "vagrant status"
  goto :localhost, :exec => "cd #{dir} && vagrant status"
  expect [ "teuton-s-node-opensuse", "running" ]

  target "uname -a"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"uname -a\""
  expect [ "Linux", "s-node" ]

  goto :localhost, :exec => "cd #{dir} && vagrant halt"
  goto :localhost, :exec => "cd #{dir} && vagrant destroy --force"
end
