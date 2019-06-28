
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

group "Debian (panel)" do

  dir = "panel/debian"

  goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant up\""

  target "vagrant status"
  goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant status\""
  expect [ "teuton-panel-debian", "running" ]

  target "uname -a"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"uname -a\""
  expect [ "Debian", "panel" ]

  target "teuton-panel"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"vdir /usr/local/bin\""
  expect "teuton-panel"

  target "/opt/teuton-panel"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"vdir /opt\""
  expect "teuton-panel"

  goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant halt\""
  goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant destroy\""
end
