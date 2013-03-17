#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

EM.synchrony do

    Thin::Server.start Padrino.application, "0.0.0.0", ENV.fetch("PORT",3000).to_i

    if ENV["EM_RUN_LOOP"]
        EM.add_periodic_timer(ENV.fetch("PING_TIMER",120).to_i) do
            Fiber.new do
                Site.find_each do |site|
                    em_http_params = site.request_body.present? ? site.request_body_casted : {}
                    em_http_params = {:body => em_http_params}
                    
                    client     = EventMachine::HttpRequest.new(site.address)
                    resp       = client.send(site.request_type.to_sym, em_http_params) 
                    code       = resp.response_header.status

                    puts "Pinged on #{site.address} with #{site.request_type} and params #{em_http_params}; result: #{code}"
                end
            end.resume
        end
    end
    
end