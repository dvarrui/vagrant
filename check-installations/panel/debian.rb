
group "PANEL: Debian" do

  log "Be patient..."
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
