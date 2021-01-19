require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner

  attr_reader :name, :species, :say_species
  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"
    @say_species = "I am a human."
    @@all << self 
  end 

  def self.all
    @@all 
  end 

  def self.count
    @@all.count
  end 

  def self.reset_all 
    @@all.clear
  end 

  def cats
    Cat.all.select do |cat|
        cat.owner == self
    end
  end 

  def dogs 
    Dog.all.select do |dog|
      dog.owner == self 
    end 
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end 
  end 

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end 

  def sell_pets
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end 
    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end 
  end 

  def list_pets
    number_of_cats = cats.count 
    number_of_dogs = dogs.count
    all_pets = cats.count + dogs.count
    return "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end 
  


end