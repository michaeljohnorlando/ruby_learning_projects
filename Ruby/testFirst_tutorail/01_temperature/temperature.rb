# Here is how to convert °F to °C. This is actually Fahrenheit to Celsius
# and not Farenheit to Celcius, though the mis-spellings of the temperature
# scales are common. The temperature conversion is easy to do: Take the °F 
# temperature and subtract 32.
# Multiply this number by 5.
# Divide this number by 9 to obtain your answer in °C.

def ftoc number
    ((number-32)*5)/9
end

# Here is how to convert °C to °F.
# Multiply the °C temperature by 1.8
# Add 32 to this number. This the answer in °F

def ctof number
    number*1.8+32
end