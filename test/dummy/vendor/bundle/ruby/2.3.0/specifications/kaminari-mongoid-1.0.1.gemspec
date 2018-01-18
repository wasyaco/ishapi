# -*- encoding: utf-8 -*-
# stub: kaminari-mongoid 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "kaminari-mongoid"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Akira Matsuda"]
  s.bindir = "exe"
  s.date = "2017-01-25"
  s.description = "kaminari-mongoid lets your Mongoid models be paginatable"
  s.email = ["ronnie@dio.jp"]
  s.homepage = "https://github.com/kaminari/kaminari-mongoid"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Kaminari Mongoid adapter"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<kaminari-core>, ["~> 1.0"])
      s.add_runtime_dependency(%q<mongoid>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.9"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<test-unit-rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<byebug>, [">= 0"])
    else
      s.add_dependency(%q<kaminari-core>, ["~> 1.0"])
      s.add_dependency(%q<mongoid>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.9"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<test-unit-rails>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<byebug>, [">= 0"])
    end
  else
    s.add_dependency(%q<kaminari-core>, ["~> 1.0"])
    s.add_dependency(%q<mongoid>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.9"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<test-unit-rails>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<byebug>, [">= 0"])
  end
end
