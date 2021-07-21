def parseTime(intputString)
  arr = intputString.split(":", 2)
  hour = Integer(arr[0]) rescue -1
  minute = Integer(arr[1]) rescue -1
  if hour < 0 || hour > 23 || minute < 0 || minute > 59
    hour = -1
    minute = -1
  end

  minute = Float(minute) rescue -1

  return hour + minute / 60
end

def checkLunch(checkIn, checkOut)
  if checkOut - checkIn > 4 && checkIn <= 12 && checkOut >= 13
    return true
  else
    return false
  end
end

def checkDinner(checkIn, checkOut)
  if checkOut - checkIn > 3 && checkOut > 21
    return true
  else
    return false
  end
end

def checkOT(checkInStr, checkOutStr)
  checkIn = parseTime(checkInStr)
  checkOut = parseTime(checkOutStr)
    
  if checkIn < 0
    return "Check-in time format error"
  end

  if checkOut < 0
    return "Check-out time format error"
  end

  otTime = checkOut - checkIn
  if otTime < 0
    return "Check-out before Check-in ???"
  end
  lunch = "N"
  dinner = "N"
  if checkLunch(checkIn, checkOut)
    lunch = "Y"
    otTime = otTime - 1
  end

  if checkDinner(checkIn, checkOut) 
    dinner = "Y"
  end

  return "OT = #{otTime}, Lunch: #{lunch}, Dinner: #{dinner}"

end

puts "Check-in Time: (hh:mm)"
checkInStr = gets.chomp
puts "Check-out Time: (hh:mm)"
checkOutStr = gets.chomp

puts checkOT(checkInStr, checkOutStr)