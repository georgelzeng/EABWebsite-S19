# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first: 'Michael', last: 'Wu', email: 'michaelwu@berkeley.edu', team: 'exec', skillset: 'None', sid: '42042069', password: '123456', password_confirmation: '123456', code: 'Michael')
User.create!(first: 'George', last: 'Zeng', email: 'glz@berkeley.edu', team: 'kiwi', skillset: 'None', sid: '12345678', password: '123456', password_confirmation: '123456', code: 'Michael')
User.create!(first: 'Nick', last: 'cai', email: 'ncai@yahoo.com', team: 'cs169', skillset: 'None', sid: '12342342', password: '123456', password_confirmation: '123456', code: 'Michael')
User.create!(first: 'Mihir', last: 'Chitalia', email: 'mhc@berkeley.edu', team: 'kiwi', skillset: 'None', sid: '12345679', password: '123456', password_confirmation: '123456', code: 'Michael')
User.create!(first: 'Jason', last: 'Bi', email: 'jbi@berkeley.edu', team: 'cs169', skillset: 'None', sid: '13371384', password: '123456', password_confirmation: '123456', code: 'Michael')
User.create!(first: 'Chau', last: 'Van', email: 'cv@berkeley.edu', team: 'kiwi', skillset: 'None', sid: '69420420', password: '123456', password_confirmation: '123456', code: 'Michael')
User.create!(first: 'Kyle', last: 'Ngo', email: 'kylengo@berkeley.edu', team: 'kiwi', skillset: 'None', sid: '87654321', password: '123456', password_confirmation: '123456', code: 'Michael')
