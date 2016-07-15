#!/usr/bin/ruby

require 'sqlite3'

class Workcounter
	def initialize()

		begin

			@db = SQLite3::Database.new "stunden.db"
			create_stundendb

		rescue SQLite3::Exception => e

			puts "Exception occurred"
			puts e

		ensure
			#@db.close if @db
		end
	end




	def create_stundendb
		@db.execute "CREATE TABLE IF NOT EXISTS stunden(Id INTEGER PRIMARY KEY,
	Date INTEGER, Wt INTEGER, Start INTEGER, End INTEGER, Breaks INTEGER, Duration INTEGER, Topic TEXT)"
	end



	def add_worktime(date = nil, wt = nil, start_time = nil, end_time = nil, breaks = nil, duration, topic)

		date = Time.now unless date
		wt = '' unless wt
		end_time = Time.now unless end_time
		start_time = end_time - duration unless start_time
		breaks = '' unless breaks


		insert_command = "INSERT INTO stunden VALUES(NULL,'#{date}', '#{wt}', '#{start_time}', '#{end_time}', '#{breaks}','#{duration}', '#{topic}')"
		puts insert_command
		@db.execute insert_command


	end
end


w= Workcounter.new
w.add_worktime(3,"hallotest")
