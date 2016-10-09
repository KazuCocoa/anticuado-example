require "git"
require "anticuado"

my_chat_ex_path = "project/my_chat_ex"
cocapods_sample = "project/WebSocketDemoForiOS"
carthage_sample = "project/MySandBoxApp"
android_sample = "project/DroidTestHelper"

def clone_or_pull(repo, path)
  Git.clone(repo, path)
rescue
  Git.open(path).pull
end

clone_or_pull("https://github.com/KazuCocoa/my_chat_ex", my_chat_ex_path)
clone_or_pull("https://github.com/KazuCocoa/WebSocketDemoForiOS", cocapods_sample)
clone_or_pull("https://github.com/KazuCocoa/MySandBoxApp", carthage_sample)
clone_or_pull("https://github.com/KazuCocoa/DroidTestHelper", android_sample)

p "=======Elixir========"

outdated_ex = ::Anticuado::Elixir::Hex.outdated my_chat_ex_path
out_ex = ::Anticuado::Elixir::Hex.format outdated_ex
p out_ex

p "=======iOS/CocoaPods========"

outdated_ios_co = ::Anticuado::IOS::CocoaPods.outdated cocapods_sample
out_ios_co = ::Anticuado::IOS::CocoaPods.format outdated_ios_co
p out_ios_co

p "=======iOS/Carthage========"

outdated_ios_ca = ::Anticuado::IOS::Carthage.outdated carthage_sample
out_ios_ca = ::Anticuado::IOS::CocoaPods.format outdated_ios_ca
p out_ios_ca

p "=======Android/Gradle========"

::Anticuado::Java::Gradle.outdated android_sample, true
json_android = ::Anticuado::Java::Gradle.parse_json "#{android_sample}/build/dependencyUpdates/report.json"
out_android = ::Anticuado::Java::Gradle.format json_android
p out_android
