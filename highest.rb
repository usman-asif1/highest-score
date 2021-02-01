#!/usr/bin/ruby
require 'json'

def die(msg, code=0)
  puts msg

  exit code
end

def validate_args(args)
  die($errors[:invalid_args], -1) if args.length != 2
  die($errors[:invalid_file]) unless File.file?(args[0])
  die($errors[:invalid_score]) if args[1].to_i == 0
end

$errors = {
  invalid_file: 'Invalid file.',
  invalid_score: 'Invalid score count.',
  invalid_args: 'Invalid arguments.',
  invalid_id: 'Invalid format. ID does not exist.',
  invalid_format: "Invalid JSON format. No JSON object could be decoded.\nTHIS IS NOT JSON."
}

validate_args(ARGV)

scores = open(ARGV[0]).map.with_index do |line, index|
    key, value = line.split(':', 2)

    { score: key.to_i, data: value.strip, index: index }
  end

top_scores = scores.sort_by { |obj| [obj[:score], obj[:index]] }
               .reverse
               .uniq { |obj| obj[:score] }
               .take(ARGV[1].to_i)
               .map.with_index do |score, index|
                 begin
                   data = JSON.parse score[:data]

                   die($errors[:invalid_id]) unless data.has_key?('id')

                   { score: score[:score], id: data['id'] }

                 rescue
                   die($errors[:invalid_format])
                 end
               end

die(JSON.pretty_generate(top_scores))
