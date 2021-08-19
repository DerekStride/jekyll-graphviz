# frozen_string_literal: true

require "test_helper"

class Jekyll::GraphvizTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Graphviz::VERSION
  end

  def test_matching_file_extensions
    assert(converter.matches(".dot"))
  end

  def test_determining_the_output_file_extension
    assert_equal(converter.output_ext(".dot"), ".svg")
  end

  def test_determining_the_output_file_extension_with_another_output_type
    ext = converter("graphviz" => { "format" => "jpg" }).output_ext(".dot")
    assert_equal(ext, ".jpg")
  end

  def test_output
    output = converter.convert("digraph X { a -> b }")
    assert_match(/svg/, output)
    assert_equal(Encoding::UTF_8, output.encoding)
  end

  def test_output_to_another_output_type
    output = converter("graphviz" => { "format" => "jpg" }).convert("digraph X { a -> b }")
    assert_equal(Encoding::ASCII_8BIT, output.encoding)
  end

  def test_files_are_cached
    content = "digraph x { a -> b }"
    converter.convert(content)
    assert(converter.cache.key?(content))
  end

  def converter(opts = {})
    config = Jekyll::Configuration::DEFAULTS.merge(opts)
    @converter ||= Jekyll::Converters::Graphviz.new(config)
  end
end
