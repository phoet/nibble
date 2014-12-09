voice_list['voices'].each do |mapping|
  case mapping['lang']
  when 'fr', 'ca', 'be'
    speak "bonjour je m'apelle #{mapping['id']}", voice: mapping['id']
  when 'de'
    speak "hallo, ich heiße #{mapping['id']}", voice: mapping['id']
  when 'us', 'uk'
    speak "hi, my name is #{mapping['id']}", voice: mapping['id']
  when 'it'
    speak "ciao, mi chiamo #{mapping['id']}", voice: mapping['id']
  else
    speak "my name is #{mapping['id']} and this is #{mapping['lang']}"
  end
end
