# 2015-08-25 19:09:52 +0800
# 101.236374
# 102.595443
# 2015-08-25 19:11:35 +0800

require 'mysql2'


client = Mysql2::Client.new(
  :host => 'localhost',
  :username => 'root',
  :password => '123654789',
  :database => 'domain_noti_development',
  :encoding => 'utf8',
  :read_timeout => 600,
  :write_timeout => 600,
  :connect_timeout => 600,
  :reconnect => true
)




p c = Time.now


query_string = "insert into users (id, name, email, created_at, updated_at) values "

#con.query start_transaction
for id in 1..1000_000

  name = "\'user-#{id}\'"
  email = "\'although#{id}@gmail.com\'"
  created_at = updated_at = Time.now

  query_string << "(#{id}, #{name}, #{email}, \'#{created_at}\', \'#{updated_at}\'),"
end


p f = Time.now - c

query_string[-1] = ";"


client.query(query_string)


#con.query query_string
#con.query commit

#con.close

p d = Time.now - c
p Time.now




