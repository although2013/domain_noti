require 'mysql'

con = Mysql.new 'localhost', 'root', '', 'domain_noti_development'

p c = Time.now

start_transaction = "START TRANSACTION; "
commit = "COMMIT;"


con.query start_transaction
for id in 1..1_000_000

  name = "\'user-#{id}\'"
  email = "\'although#{id}@gmail.com\'"
  created_at = updated_at = Time.now

  con.query "insert into users (id, name, email, created_at, updated_at) values (#{id}, #{name}, #{email}, \'#{created_at}\', \'#{updated_at}\'); "
end

f = Time.now - c

con.query commit

con.close

p f
p d = Time.now - c
p Time.now


# 2015-08-25 19:09:52 +0800
# 101.236374
# 102.595443
# 2015-08-25 19:11:35 +0800