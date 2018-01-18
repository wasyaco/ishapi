# -*- encoding: utf-8 -*-
# stub: mongoid-autoinc 6.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid-autoinc"
  s.version = "6.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Robert Beekman", "Steven Weller", "Jacob Vosmaer"]
  s.date = "2017-03-27"
  s.description = "Think auto incrementing field from SQL for mongoid."
  s.email = ["robert@80beans.com", "steven@80beans.com", "jacob@80beans.com"]
  s.homepage = "https://github.com/suweller/mongoid-autoinc"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Add auto incrementing fields to mongoid documents"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, ["~> 6.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<foreman>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<mongoid>, ["~> 6.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<foreman>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<mongoid>, ["~> 6.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<foreman>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
