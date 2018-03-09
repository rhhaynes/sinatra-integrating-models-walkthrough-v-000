require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    p @analyzed_text.most_used_letter.keys.first.to_s.upcase
    p @analyzed_text.most_used_letter.values.first.to_s
    erb :results
  end
end
