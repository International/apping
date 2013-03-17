#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

EM.synchrony do

    Thin::Server.start Padrino.application, "0.0.0.0", ENV.fetch("PORT",3000).to_i

    EM.add_periodic_timer(10) do
        Fiber.new do
            Site.find_each do |site|
                http = EventMachine::HttpRequest.new(site.address).get
                puts "Posted on #{site.address}"
                puts http.response_header.status
            end
        end.resume
    end
    
end