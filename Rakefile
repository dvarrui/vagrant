# File: Rakefile
# Usage: rake

desc 'Default: show help'
task default: :help do
end

desc 'Show help'
task :help do
  system("rake -T")
end

desc 'Check panel installation'
task :panel do
  system("teuton test/panel")
end

desc 'Check t-node installation'
task :tnode do
  system("teuton test/t-node")
end

desc 'Check s-node installation'
task :snode do
  system("teuton test/s-node")
end
