#!/usr/bin/ruby
#this program checks to see how much vacation time an employee has accrued
require 'date'

#each new employee gets their own data set
class Employee
	attr_accessor :date_of_hire, :start_date, :end_date, :used_hours, :extra_hours

	#finds how many scheduled working days from a start_date to an end_date
	def total_workdays
		n = 1
		workdays = [1,2,3,4,5] 	#this assumes employees work monday - friday
		start = Date.parse(@start_date)

		until start == @end_date
			if workdays.include?(start.wday)
				n +=1
			end
			start = start + 1
		end
		n
	end

	#finds how many hours employee accrued from the start_date to end_date, depending on scheduled working days worked
	def accrued_hours

	#hours accrued per day depending on years worked
		less_than_5 = 120.0 / 52 / 5
		more_than_5 = 160.0 / 52 / 5

		start = Date.parse(@start_date)
		if Date.parse(date_of_hire).year - start.year < 5
			total_workdays * less_than_5 - @used_hours + @extra_hours

    	elsif Date.parse(date_of_hire).year - start.year > 5
    		total_workdays * more_than_5 - @used_hours + @extra_hours
		end
	end

end

#test this out
Lena = Employee.new
Lena.date_of_hire = '14-10-08'
Lena.start_date = '2014-10-08'
Lena.end_date = Date.today
Lena.used_hours = 0
Lena.extra_hours = 8

puts Lena.accrued_hours



##ignore this for now--
class Time
  def is_workday?
     [1,2,3,4,5].include?(wday)
  end

  def is_weekend?
     [0,6,7].include?(wday)
  end
end