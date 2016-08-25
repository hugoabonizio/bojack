require "readline"
require "bojack-client"

module BoJack
  class Console
    @hostname : String
    @port : Int8 | Int16 | Int32 | Int64

    def initialize(@hostname = "127.0.0.1", @port = 5000)
      @client = BoJack::Client.new(@hostname, @port)
    end

    def start
      loop do
        input = Readline.readline("> ", true)
        puts @client.send(input)
        break if input == "close"
      end
    end
  end
end
