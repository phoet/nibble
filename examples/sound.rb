# sound_list['sounds'].shuffle.first(3).each do |sound|
#   sound(id: sound['id'])
# end

puts sound url: 'http://streaming.radio.rtl.fr/rtl-1-44-96'

Kernel.sleep 30
sound_control cmd: 'pause'
Kernel.sleep 5
sound_control cmd: 'pause'
Kernel.sleep 5
sound_control cmd: 'quit'
