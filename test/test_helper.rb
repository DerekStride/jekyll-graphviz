# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "jekyll-graphviz"
require "pry-byebug" if ENV["PRY"]
require "minitest/autorun"
