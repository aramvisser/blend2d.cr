require "clang"

require "./parser"
require "./lib_files_writer"

if ARGV.empty?
  STDERR.puts("Requires path to 'blend2d.h' as first argument")
  exit
end

file_name = ARGV.first
base_dir = Path.new(file_name).dirname

include_files = [
  file_name,
  base_dir + "/blend2d/bitarray.h", # bitarray is missing from blend2d.h, so manually include it
]

input_content = include_files.map { |f| "#include <#{f}>\n" }.join
files = [Clang::UnsavedFile.new("input.c", input_content)]

index = Clang::Index.new
args = ["-I/usr/include"]
options = Clang::TranslationUnit.default_options |
  Clang::TranslationUnit::Options::SkipFunctionBodies |
  Clang::TranslationUnit::Options::DetailedPreprocessingRecord

tu = Clang::TranslationUnit.from_source(index, files, args, options)

parser = Parser.new
parser.visit tu.cursor

LibFilesWriter.new(parser).write_files
`crystal tool format #{__DIR__}/../src/blend2d/lib_blend2d`
