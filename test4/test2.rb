require "time"
require "date"

def checkLeaveAllowance(entryDateStr)
  entryDate = Date.strptime(entryDateStr, "%m/%d/%Y") rescue nil
  if entryDate.nil?
    return "Invalid Date"
  end
  now = Date.parse("#{Time.new()}")

  if now < entryDate
    return "Entry Day in the future ???"
  end

  leaveAllowance = calculateLeaveAllowance(entryDate, now)
  return "Leave Allowance: #{leaveAllowance} days"
end

def calculateLeaveAllowance(entryDate, now)
  if now < entryDate
    return -1
  end

  yearDiff = now.year - entryDate.year
  if yearDiff >= 5
    return 14
  elsif yearDiff >= 4
    return 13
  elsif yearDiff > 0
    return 12
  else
    result = Float(0)
    entryDay = entryDate.mday
    if entryDay < 10
      result += 1
    else
      result += 0.5
    end
    entryMonth = entryDate.mon
    result += 12 - entryMonth
    return result
  end
end

puts "Entry Date:"

input = gets.chomp

puts checkLeaveAllowance(input)
