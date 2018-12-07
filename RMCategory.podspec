
Pod::Spec.new do |s|
  s.name     = 'RMCategory' 
  s.version  = '0.0.1' 
  s.license  = "MIT"  //开源协议
  s.summary  = 'This is oc util Category' //简单的描述 
  s.homepage = 'https://github.com/bruce107/RMCategory' //主页
  s.author   = { 'bruce' => 'bruceyoung107@gmail.com' } //作者
  s.source   = { :git => 'https://github.com/bruce107/RMCategory.git', :tag => "0.0.1" } //git路径、指定tag号
  s.platform = :ios
  s.source_files = "RMCategory", "RMCategory/RMCategory/*.{h,m}"''  //库的源代码文件  
  s.description  = <<-DESC
		11category
                   DESC
  s.requires_arc = true
end


