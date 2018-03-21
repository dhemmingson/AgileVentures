# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Process md files in the root path' do
  markdown_paths = Dir.glob('./*').select { |path| path if path =~ /\.md$/i }

  markdown_paths.each do |markdown_path|
    it "should convert '#{markdown_path}' markdown to html" do
      File.open(markdown_path, 'r:UTF-8') do |file|
        encoded_markdown = Base64.encode64(file.read)
        decoded_markdown = Base64.decode64(encoded_markdown)
        expect { MarkdownConverter.new(decoded_markdown).as_html }.not_to raise_error
      end
    end
  end
end
