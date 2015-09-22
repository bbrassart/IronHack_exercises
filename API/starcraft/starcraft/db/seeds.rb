Player.destroy_all
Match.destroy_all
puts "Deleted"

players = [
  Player.create(name: "Frank"),
  Player.create(name: "Rick"),
  Player.create(name: "Pat"),
  Player.create(name: "Roberto")
]


Match.create(winner_faction: "Terrans",
  loser_faction: "Protoss",
  duration: 120,
  date: DateTime.now,
  winner_id: players[0].id,
  loser_id: players[2].id )

Match.create(winner_faction: "Protoss",
  loser_faction: "Zerg",
  duration: 120,
  date: DateTime.now,
  winner_id: players[0].id,
  loser_id: players[2].id )

Match.create(winner_faction: "Zerg",
  loser_faction: "Terrans",
  duration: 120,
  date: DateTime.now,
  winner_id: players[1].id,
  loser_id: players[0].id )

Match.create(winner_faction: "Terrans",
  loser_faction: "Zerg",
  duration: 120,
  date: DateTime.now,
  winner_id: players[3].id,
  loser_id: players[1].id )

Match.create(winner_faction: "Zerg",
  loser_faction: "Protoss",
  duration: 120,
  date: DateTime.now,
  winner_id: players[2].id,
  loser_id: players[3].id )


puts "Created"
