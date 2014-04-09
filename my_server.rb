#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-

$LOAD_PATH.unshift 'lib'

require 'rubygems'
require 'bundler/setup'

require 'reel'

class MyServer < Reel::Server::HTTP
  def initialize host = '127.0.0.1', port = 3000
    super host, port, &method(:on_connection)
  end

  def on_connection connection
    connection.each_request do |request|
      handle_request request
    end
  end

  def handle_request request
    request.respond :ok, 'Hello, world!'
  end

end

MyServer.run
