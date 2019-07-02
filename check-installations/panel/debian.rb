
group "PANEL: Debian" do

  puts "[INFO] Be patient..."
  dir = "panel/debian"

  puts "[INFO] vagrant up..."
  goto :localhost, :exec => "cd #{dir} && vagrant up"

  target "vagrant status"
  goto :localhost, :exec => "cd #{dir} && vagrant status"
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

  goto :localhost, :exec => "cd #{dir} && vagrant halt"
  goto :localhost, :exec => "cd #{dir} && vagrant destroy --force"
end
