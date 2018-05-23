# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Board.create(name: 'Workshop').tap do |b|
  b.lists.create(name: 'To Do').tap do |l|
    l.cards.create(text: 'Encuesta')
    l.cards.create(text: 'Agradecimiento')
  end

  b.lists.create(name: 'Doing').tap do |l|
    l.cards.create(text: 'Dar el workshop!')
  end

  b.lists.create(name: 'Done').tap do |l|
    l.cards.create(text: 'Enviar emails')
    l.cards.create(text: 'Armar VMs')
  end
end

Board.create(name: 'Personal').tap do |b|
  b.lists.create(name: 'Shopping list').tap do |l|
    l.cards.create(text: 'Auto')
    l.cards.create(text: 'Casa')
    l.cards.create(text: 'Bici')
  end

  b.lists.create(name: 'Foods').tap do |l|
    l.cards.create(text: 'Tomate')
    l.cards.create(text: 'Lechuga')
    l.cards.create(text: 'Pan')
  end
end
