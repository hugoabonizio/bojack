require "readline"
require "./client"
require "./params"
require "./command"

module BoJack
  class Console
    @hostname : String
    @port : Int8 | Int16 | Int32 | Int64

    def initialize(@hostname = "127.0.0.1", @port = 5000)
      @client = Client.new("127.0.0.1", 5000)
    end

    def start
      loop do
        input = Readline.readline("> ", true)
        puts @client.execute(input)
        break if input == "close"
      end
    end
  end
end
