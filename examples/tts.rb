voice_list['voices'].each do |mapping|
  case mapping['lang']
  when 'fr', 'ca', 'be'
    say "bonjour je m'apelle #{mapping['id']}", voice: mapping['id']
  when 'de'
    say "hallo, ich heiße #{mapping['id']}", voice: mapping['id']
  when 'us', 'uk'
    say "hi, my name is #{mapping['id']}", voice: mapping['id']
  when 'it'
    say "ciao, mi chiamo #{mapping['id']}", voice: mapping['id']
  else
    say "my name is #{mapping['id']} and this is #{mapping['lang']}"
  end
end
