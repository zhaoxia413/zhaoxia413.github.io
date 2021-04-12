Gem::Specification.new do |spec|
  spec.name          = "SYSUCC_zhaoxia"
  spec.version       = "2.0.10"
  spec.authors       = ["zhaoxia"]
  spec.email         = ["zhaoxia1@sysucc.org.cn"]

  spec.summary       = "Microbiome in ICI"
  spec.license       = "MIT"
  spec.homepage      = "https://zhaoxia413.github.io/"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "github-pages", "~> 209"
end
