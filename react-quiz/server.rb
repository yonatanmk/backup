require "sinatra"
require "sinatra/json"
require "json"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces
set :public_folder, File.join(File.dirname(__FILE__), "public")

get "/" do
  erb :home
end

get "/api/questions.json" do
  random_question = {'question' => nil, 'answers' => []}

  questions_data_string = File.read('./questions.json')
  questions_data = JSON.parse(questions_data_string)

  random_question['question'] = questions_data['questions'].sample
  questions_data['answers'].each do |answer|
    random_question['answers'] << answer if answer['question_id'] == random_question['question']['id']
  end
  json random_question: random_question
end
