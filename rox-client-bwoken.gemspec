# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: rox-client-bwoken 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rox-client-bwoken"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Simon Oulevay"]
  s.date = "2014-04-08"
  s.description = "Wraps bwoken to collect test results and send them to a ROX Center server."
  s.email = "simon.oulevay@lotaris.com"
  s.executables = ["rox-bwoken"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "lib/rox-client-bwoken.rb",
    "lib/rox-client-bwoken/formatter.rb"
  ]
  s.homepage = "https://github.com/lotaris/rox-client-bwoken"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.1"
  s.summary = "Bwoken client for ROX Center."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bwoken>, ["~> 2.0"])
      s.add_runtime_dependency(%q<rox-client-ruby>, ["~> 0.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<bundler>, ["~> 1"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_development_dependency(%q<rake-version>, ["~> 0.4"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7"])
    else
      s.add_dependency(%q<bwoken>, ["~> 2.0"])
      s.add_dependency(%q<rox-client-ruby>, ["~> 0.1"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<bundler>, ["~> 1"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_dependency(%q<rake-version>, ["~> 0.4"])
      s.add_dependency(%q<simplecov>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<bwoken>, ["~> 2.0"])
    s.add_dependency(%q<rox-client-ruby>, ["~> 0.1"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<bundler>, ["~> 1"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
    s.add_dependency(%q<rake-version>, ["~> 0.4"])
    s.add_dependency(%q<simplecov>, ["~> 0.7"])
  end
end

