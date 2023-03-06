#!/usr/bin/env ruby

# file: simplepubsub_drb.rb

require 'onedrb'
require 'xml-registry' 


module SimplePubSubDRb
  class Internals

    def initialize
      @h = {}
    end

    def publish(fqm)

      topic, msg = fqm.split(/: +/,2)       
      
      reg = XMLRegistry.new 
      reg.set_key topic, ''

      # find the subscribers who match the current topic
      #
      a = @h.select {|key, value| reg.get_key(key) }
      
      a.map(&:last).flatten(1).uniq.each do |ip_address|
        subscriber = OneDrb::Client.new host: ip_address, port: '59003'
        subscriber.receive(topic, msg)
      end
      
    end

    def subscribe(topic, ip_address)
      @h[topic] ||= []
      @h[topic] << ip_address
    end    

  end

  class Broker
    def self.start(host: '0.0.0.0', port: '59004')
      drb = OneDrb::Server.new host: host, port: port, obj: Internals.new
      drb.start
    end
  end
end
