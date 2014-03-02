# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.create([
	{name: 'Rails 3.2'},
	{name: 'Rails 4.0'},
	{name: 'Ruby'},
	{name: 'Beginner'},
	{name: 'Intermediate'},
	{name: 'Advanced'},
	{name: 'Screencast'},
	{name: 'Book'},
	{name: 'Tutorial'},
	{name: 'Course'},
	{name: 'Paid'}, 
	{name: 'Free'}
])
