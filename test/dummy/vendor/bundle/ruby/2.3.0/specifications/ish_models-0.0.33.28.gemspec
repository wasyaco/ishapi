# -*- encoding: utf-8 -*-
# stub: ish_models 0.0.33.28 ruby lib

Gem::Specification.new do |s|
  s.name = "ish_models"
  s.version = "0.0.33.28"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["piousbox"]
  s.date = "2017-05-10"
  s.description = "models of ish"
  s.email = "victor@wasya.co"
  s.homepage = "http://wasya.co"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "models of ish"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, [">= 6.1.0", "~> 6.1.0"])
      s.add_runtime_dependency(%q<devise>, ["> 0"])
    else
      s.add_dependency(%q<mongoid>, [">= 6.1.0", "~> 6.1.0"])
      s.add_dependency(%q<devise>, ["> 0"])
    end
  else
    s.add_dependency(%q<mongoid>, [">= 6.1.0", "~> 6.1.0"])
    s.add_dependency(%q<devise>, ["> 0"])
  end
end
