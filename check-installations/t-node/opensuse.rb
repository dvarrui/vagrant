
group "T-NODE: Opensuse" do

  log "[INFO] Be patient..."

  dir = "t-node/opensuse"

  log "[INFO] vagrant up..."
  goto :localhost, :exec => "cd #{dir} && vagrant up"

  target "vagrant status"
  goto :localhost, :exec => "cd #{dir} && vagrant status"
  expect [ "teuton-t-node-opensuse", "running" ]

  target "uname -a"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"uname -a\""
  expect [ "Linux", "t-node" ]

  target "teuton version"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"teuton version\""
  expect [ "teuton", "2.0" ]

  log "[INFO] vagrant halt and detroy..."
  goto :localhost, :exec => "cd #{dir} && vagrant halt"
  goto :localhost, :exec => "cd #{dir} && vagrant destroy --force"
end
