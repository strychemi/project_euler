# Counting Sundays

=begin

You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

=end

def count_sundays()
  #Sun: 0, Mon: 1, Tuesday: 2...Sat: 6
  sunday_count = 0
  #Jan 1, 1990 starts on Monday
  #so at the end of month, it'll land on Monday
  first_day_of_week = 1
  #if we add the days of month starting from our variable above
  #we can keep track of the last day of the month
  # (1 + 31) % 7 = 4 (which is a Thursay)
  #so Feb 1, starts on a Thurs.
  #anytime this number results in a 0, we know the 1st day
  #of the month must be Sunday

  #days per month from Jan. to Dec.
  days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  daysinleap = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  (1900..2000).each do |year|
    #check if leap year, Feb = 29 days
    if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
      (0..11).each do |month|
        sunday_count += 1 if first_day_of_week == 0 && year != 1900
        first_day_of_week = (first_day_of_week + days[month]) % 7
      end
    #if not leap year, Feb = 28 days
    else
      (0..11).each do |month|
        sunday_count += 1 if first_day_of_week == 0 && year != 1900
        first_day_of_week = (first_day_of_week + daysinleap[month]) % 7
      end
    end
  end

  puts sunday_count
end

count_sundays()
