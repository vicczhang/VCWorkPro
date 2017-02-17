Pod::Spec.new do |s|
s.name = 'VCWorkPro'
s.version = '1.0'
s.summary = 'work pro'
s.homepage = 'https://github.com/vicczhang/VCWorkPro'
s.license = 'MIT'
s.platform = :ios,'8.0'
s.author = {'vicczhang' => 'vicczhang47@gmail.com'}
s.source = {:git => 'https://github.com/vicczhang/VCWorkPro.git',:tag => s.version}
s.source_files = 'VCWorkPro/*'
s.requires_arc = true
s.frameworks = 'UIKit','Foundation'
s.dependency "JSONModel"
s.dependency "ReactiveObjC"
s.dependency "MBProgressHUD"
end
