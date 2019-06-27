
group "Debian (t-node)" do

  log "Be patient..."

  dir = "t-node/debian"

  #goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant up\""

  target "vagrant status"
  goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant status\""
  expect [ "teuton-t-node-debian", "running" ]

  target "uname -a"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"uname -a\""
  expect [ "Debian", "t-node" ]

  target "teuton version"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"teuton version\""
  expect [ "teuton", "2.0" ]

end
