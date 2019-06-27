
group "T-NODE: Opensuse" do

  log "Be patient..."

  dir = "t-node/opensuse"

  #target "vagrant status"
  #goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant up\""
  #goto :localhost, :exec => "sh -c \"cd #{dir} && vagrant status\""
  #expect [ "teuton-t-node-opensuse", "running" ]

  target "uname -a"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"uname -a\""
  expect [ "Linux", "t-node" ]

  target "teuton version"
  goto :localhost, :exec => "cd #{dir} && vagrant ssh -c \"teuton version\""
  expect [ "teuton", "2.0" ]

end

play do
  show
  export
end
