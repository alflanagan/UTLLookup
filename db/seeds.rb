# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default
# values. The data can then be loaded with the rails db:seed command (or created alongside the
# database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

records = open('db/seed_data.json') do |f|
	JSON.parse(f.read())
end

papersxref = {}

# have to create all the papers first
records.each do |record|
  next if record['model'] != 'papers.newspaper'

  fields = record['fields']
  new_paper = Newspaper.create!(name: fields['name'])
  # cross-reference old ID with newly created ID
  papersxref[record['pk']] = new_paper.id
end

puts "Created #{Newspaper.all.count} newspaper records."

records.each do |record|
  next if record['model'] != 'papers.townnewssite'

  fields = record['fields']
  # get new id from old ID
  newspaper_id = papersxref[fields['paper']]
  TownnewsSite.create!(name: fields['name'], URL: fields['URL'], newspaper_id: newspaper_id)
end

puts "Created #{TownnewsSite.all.count} BLOX site records."

records.each do |record|
  next if record['model'] != 'utl_files.application'

  Application.create!(name: record['fields']['name'])
end

puts "Created #{Application.all.count} BLOX application records."
