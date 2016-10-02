require "git"
require "anticuado"

my_chat_ex_path = "project/my_chat_ex"
web_socket_ios = "project/WebSocketDemoForiOS"

def clone_or_pull(repo, path)
  Git.clone(repo, path)
rescue
  Git.open(path).pull
end

clone_or_pull("https://github.com/KazuCocoa/my_chat_ex", my_chat_ex_path)
clone_or_pull("https://github.com/KazuCocoa/WebSocketDemoForiOS", web_socket_ios)


p "=======Elixir========"

outdated_ex = ::Anticuado::Elixir::Hex.outdated project: my_chat_ex_path
out_ex = ::Anticuado::Elixir::Hex.format outdated_ex
p out_ex

p "=======iOS/CocoaPods========"

outdated_ios = ::Anticuado::IOS::CocoaPods.outdated project: web_socket_ios
out_ios = ::Anticuado::IOS::CocoaPods.format outdated_ios
p out_ios
