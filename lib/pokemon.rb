class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db, hp: 60)
  end


end
