# frozen_string_literal: true

module Jekyll
  module Converters
    class Graphviz < Converter
      safe true
      priority :low

      def setup
        require 'ruby-graphviz'
        @format = (@config.dig("graphviz", "format") || :svg).to_sym
        @setup = true
      end

      def matches(ext)
        ext =~ /^\.dot$/i
      end

      def output_ext(ext)
        setup unless @setup
        ".#{@format}"
      end

      def convert(content)
        setup unless @setup
        GraphViz.parse_string(content).output(@format => String)
      end
    end
  end
end
