require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize attributes={}
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
    @db = attributes[:db]
  end

  def self.save name, type, database
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find id, database
    p_mon = database.execute("SELECT * FROM pokemon WHERE id = ?;", id)
    Pokemon.new(id: p_mon[0][0], name: p_mon[0][1], type: p_mon[0][2], db: database)
  end

  # def alter_hp new_hp, database
  #   database.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  # end
end
