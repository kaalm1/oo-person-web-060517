# your code goes here
class Person
  attr_accessor  :bank_account, :happiness, :hygiene
  attr_reader :name
  @@count = 0
  @@max = 10
  @@min = 0

  def initialize(name)
      @name = name
      @bank_account = 25
      @happiness = 8
      @hygiene = 8
      @@count += 1
  end

  def clean?
    self.hygiene > 7
  end

  def happy?
    self.happiness > 7
  end

  def happiness
    @happiness = [@happiness,@@max].min
    @happiness = [@happiness,@@min].max
  end

  def hygiene
    @hygiene = [@hygiene,@@max].min
    @hygiene = [@hygiene,@@min].max
  end

  def get_paid(salary)
    self.bank_account += salary
    'all about the benjamins'
  end

  def take_bath
    self.hygiene += 4
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.happiness += 2
    self.hygiene -= 3
    "♪ another one bites the dust ♫"
  end

  def call_friend(friend)
    self.happiness += 3
    friend.happiness += 3
    "Hi #{friend.name}! It's #{self.name}. How are you?"
  end

  def start_conversation(friend,topic)
  topic_hash = {
      "weather" => {
        'first_word' => 'sun',
        'last_word' => 'rain',
        'points' => 1
      },
      "politics" => {
        'first_word' => 'partisan',
        'last_word' => 'lobbyist',
        'points' => -2
      },
      'other' => {
        'first_word' => 'blah',
        'last_word' => 'blah',
        'points' => 0
      }
    }

    topic = 'other' if (topic != 'weather' && topic != 'politics')

    self.happiness += topic_hash[topic]['points']
    friend.happiness += topic_hash[topic]['points']
    "blah blah #{topic_hash[topic]['first_word']} blah #{topic_hash[topic]['last_word']}"
  end

end
