# -*- encoding: utf-8 -*-
# stub: middleman-jasmine 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "middleman-jasmine"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andy Shipman"]
  s.date = "2014-04-15"
  s.description = "Jasmine testing framework support for Middleman"
  s.email = ["andy@cllearview.com"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Integrates Jasmine into a Middleman app. Optional support for Sprockets."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jasmine>, ["~> 2.0.0"])
      s.add_runtime_dependency(%q<middleman>, ["~> 3.3.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<jasmine>, ["~> 2.0.0"])
      s.add_dependency(%q<middleman>, ["~> 3.3.2"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<jasmine>, ["~> 2.0.0"])
    s.add_dependency(%q<middleman>, ["~> 3.3.2"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
