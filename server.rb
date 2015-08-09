require "sinatra"
require "pg"
require "pry"

def db_connection
  begin
    connection = PG.connect(dbname: "grocery_list")
    yield(connection)
  ensure
    connection.close
  end
end

def db_output
  db_connection do |conn|
      conn.exec("SELECT item FROM grocery_list")
  end
end

def db_input(item)
  db_connection do |conn|
    conn.exec("INSERT INTO grocery_list (item) VALUES ($1)", [item])
  end
end

get '/' do
  redirect '/groceries'
end

get '/groceries' do

  erb :index, locals: { db_output: db_output }
end

post '/groceries' do
  item_added = params["item_added"]
    begin
      unless item_added.empty?
        db_input(item_added)
      end
    rescue PG::Error
      redirect "/groceries"
    end
  redirect "/groceries"
end
