#!/usr/bin/ruby
#this program checks to see how much vacation time an employee has accrued
require 'date'


##ignore this for now--
class Time
  def is_workday?
     [1,2,3,4,5].include?(wday)
  end

  def is_weekend?
     [0,6,7].include?(wday)
  end
end



#read from a file or something for their hire date
hire_year = 2014
hire_month = 10
hire_day = 8
hire_date = '2014-10-08'

start_date=Date.parse(hire_date)
curr_date=Date.today


#finds the working day until the given date

class Employee
	attr_accessor :date_of_hire, :start_date, :end_date, :used_hours, :extra_hours


def workdays_until
	n = 1
	workdays = [1,2,3,4,5]
	start = Date.parse(@start_date)

	until start == @end_date
	if workdays.include?(start.wday)
	n += 1
	end
	start = start + 1
	end
	n
end



def accrued_hours
	#hours accrued per day
	less_than_5 = 120.0 / 52 / 5
	more_than_5 = 160.0 / 52 / 5
	
	start = Date.parse(@start_date)
	if Date.parse(date_of_hire).year - start.year < 5
	workdays_until * less_than_5 - @used_hours + @extra_hours

    elsif Date.parse(date_of_hire).year - start.year > 5
    workdays_until * more_than_5 - @used_hours + @extra_hours
	end
end

end

Lena = Employee.new
Lena.date_of_hire = '14-10-08'
Lena.start_date = '2014-10-08'
Lena.end_date = Date.today
Lena.used_hours = 0
Lena.extra_hours = 8 #flu shot

puts Lena.accrued_hours