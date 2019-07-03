# File: Rakefile
# Usage: rake

desc 'Default'
task default: :help do
end

desc 'Show help'
task :help do
  system("rake -T")
end

desc 'Check panel installation'
task :panel do
  system("teuton check-installations/panel.rb")
end

desc 'Check tnode installation'
task :tnode do
  system("teuton check-installations/t-node.rb")
end
