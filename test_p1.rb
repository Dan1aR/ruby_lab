# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require_relative 'lib_p1'

# Here goes some tests
class TestRobot < Minitest::Test
  def setup
    @generated_file_name = 'test_genetared.txt'
    @input_file_name = 'test_input_file'
    @output_file_name = 'test_output_file'

    generate_input_file
  end

  def test_generate_file_creates_not_empry_file
    num_sentences = 3
    generate_file(generated_file_name, num_sentences)

    assert File.exist?(generated_file_name)

    File.open(generated_file_name) do |file|
      file_content = file.read
      assert file_content.size
      assert_equal num_sentences, file_content.split("\n").size
    end
  end

  def test_file_process
    file_process(input_file_name, output_file_name)

    assert File.exist?(input_file_name)
    assert File.exist?(output_file_name)

    expected = File.open(input_file_name, &:read).split.select do |word|
      (word.count('a') + word.count('а')).positive?
    end.join(' ')
    actual = File.open(output_file_name, &:read).rstrip
    assert_equal expected, actual
  end

  def teardown
    File.delete(generated_file_name) if File.exist?(generated_file_name)
    File.delete(input_file_name) if File.exist?(input_file_name)
    File.delete(output_file_name) if File.exist?(output_file_name)
  end

  private

  attr_reader :generated_file_name, :input_file_name, :output_file_name

  def generate_input_file
    sentence = Faker::Lorem.sentence
    File.open(input_file_name, 'w') { |file| file.write sentence }
    sentence
  end
end
