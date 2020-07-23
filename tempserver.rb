#!/usr/bin/env ruby

Bundler.require :default

require 'json'
require 'time'
require 'irb'

require './lib/shims'
require './models/reading'

class TempApp < Sinatra::Base
    register Sinatra::ConfigFile
    config_file './config.yml'

    set :bind, settings.host
    set :port, settings.port

    register Sinatra::ActiveRecordExtension
    set :database_file, 'config/database.yml'

    post '/datapoint' do
        data = request.body.read

        my_temp = JSON.parse data

        temp = my_temp['temperature'].to_f
        sid = my_temp['sensor_id']

        Reading.create(sensor_id: sid, temperature: temp)

        puts data
    end

    get '/' do
        slim :index
    end

    get '/report.pdf' do
        content_type 'application/pdf'

        WickedPdf.new.pdf_from_string(
            slim(:index),
            pdf: "PDF Temperature Report",
            page_size: 'Letter',
            template: :index,
            zoom: 1,
            dpi: 300)
    end

    run!
end
