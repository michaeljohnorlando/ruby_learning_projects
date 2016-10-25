require "csv"
require "erb"
require 'sunlight/congress'   #cool site
require 'date'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def zip_cleaner(zip)  # nil.to_string works!
    zip.to_s.rjust(5,"0")[0..4]
end
def legislators_by_zip(zip)
    Sunlight::Congress::Legislator.by_zipcode(zip)
    #legislators = Sunlight::Congress::Legislator.by_zipcode(zip)
    #legislator_names = (legislators.collect {|legislator| "#{legislator.first_name}, #{legislator.last_name}"}).join(",")
end
def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")
  filename = "output/thanks_#{id}.html"
  File.open(filename,'w') {|file| file << form_letter}
end
def phone_number_cleaner(phone_number)
    phone_number.gsub!(/[-() .]/,"")
    phone_number.slice!"1"
    
    if phone_number.length == 10
        phone_number
    else 
        "#{phone_number} YOUR CONTACT NUMBER IS INVALID!"
    end
end
def clean_registration_hour(time)
    datetime    = DateTime.strptime(time,'%D %R') # converts to ruby DateTime
    time        = datetime.strftime("%H")             # Takes the %H value aka the hour
end
def filter_out_weekday(time)
    datetime        = DateTime.strptime(time,'%D %R') # converts to ruby DateTime.... did this 2 times now.... make a def???
    weekday     = datetime.strftime("%w")
end
def avg_time(time_all)
    if time_all.count == IO.readlines('/home/ubuntu/workspace/event_manager/data/event_attendees.csv').size - 1
        time_all.map!(&:to_i)
        sum = time_all.inject(0){|sum,x| sum + x }
        sum / time_all.count # puts just to see it ...
    end
end
def mode_time(time_all)
    freq = time_all.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    time_all.max_by { |v| freq[v] } # missing 16...
end

puts "event manager initilized!! \n "

template_letter = File.read "/home/ubuntu/workspace/event_manager/data/form_letter.html"
erb_template    = ERB.new template_letter
contents        = CSV.open "/home/ubuntu/workspace/event_manager/data/event_attendees.csv", headers: true, header_converters: :symbol
time_all        = []
weekday_all     = []
contents.each do |row| 
    id               = row[0]
    name             = row[:first_name] 
    zip              = zip_cleaner(row[:zipcode])
    phone_number     = phone_number_cleaner(row[:homephone])
    legislator_names = legislators_by_zip(zip)
    personal_letter  = erb_template.result(binding)
    reg_week_day     = filter_out_weekday(row[:regdate])
    reg_time         = clean_registration_hour(row[:regdate])
    
    time_all    << reg_time
    weekday_all << reg_week_day
    
    if avg_time(time_all) != nil          # just to disply the data...
    puts " Registration Time     =  avg:#{avg_time(time_all)} mode:#{mode_time(time_all)}  #24hr format"
    puts " Registration Week Day =  avg:#{Date::DAYNAMES[avg_time(weekday_all)]} mode:#{Date::DAYNAMES[mode_time(weekday_all)]}"
    end


    save_thank_you_letters(id,personal_letter)

    #personal_letter = template_letter.gsub('FIRST_NAME',name)
    #personal_letter.gsub!('LEGISLATORS',legislator_names)
end

#contents = File.read "/home/ubuntu/workspace/event_manager/data/event_attendees.csv"
#puts contents

#lines = File.readlines "/home/ubuntu/workspace/event_manager/data/event_attendees.csv"
#lines.each {|line| puts line}
#lines.each_with_index do |line,index|
#    next if index == 0
#    column = line.split(",") 
#    puts column[2]
#end