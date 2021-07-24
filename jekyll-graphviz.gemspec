# frozen_string_literal: true

require_relative "lib/jekyll-graphviz/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-graphviz"
  spec.version       = Jekyll::Graphviz::VERSION
  spec.authors       = ["derekstride"]
  spec.email         = ["djgstride@gmail.com"]
  spec.summary       = "A GraphViz dot file converter file Jekyll."
  spec.description   = "A GraphViz dot file converter file Jekyll."
  spec.homepage      = "https://github.com/DerekStride/jekyll-graphviz"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/DerekStride/jekyll-graphviz"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4.0"

  spec.add_runtime_dependency "ruby-graphviz", "~> 1.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "jekyll", "~> 4.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry-byebug"
end
