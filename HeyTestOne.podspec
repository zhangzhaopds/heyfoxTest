#
#  Be sure to run `pod spec lint HeyTestOne.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HeyTestOne"
  s.version      = "0.0.1"
  s.summary      = "这个真的是简介"
  s.homepage     = "https://github.com/zhangzhaopds/heyfoxTest"
  s.author             = { "heyfox" => "zhangzhaopds@foxmail.com" }
  s.source       = { :git => "https://github.com/zhangzhaopds/heyfoxTest.git", :tag => s.version }
  s.requires_arc = true
  s.source_files  = "HeyLoading/*"
  s.dependency = "MJRefresh"

end
