# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://hp-api.herokuapp.com/api/characters'
characters_serialized = URI.open(url).read
characters = JSON.parse(characters_serialized)

characters.reject! { |character| character['name'] == 'Mrs Norris' }

descriptions = {
                  "Harry Potter" => "Orphaned son of James and Lily Potter, Gryffindor student at Hogwarts, and co-founded and first leader of Dumbledore's Army. The husband of Ginny Weasley, father of James Sirius, Albus Severus and Lily Luna Potter.",

                  "Hermione Granger" => "She first appears in Harry Potter and the Philosopher's Stone, as a new student on her way to Hogwarts. After Harry and Ron save her from a mountain troll in the girls' restroom, she becomes best friends with them and often uses her quick wit, deft recall, and encyclopaedic knowledge to lend aid in dire situations.",

                  "Ron Weasley" => "Ron Weasley is Harry Potter’s best friend and the youngest son of Molly and Arthur Weasley. The story of Ron’s life is one of being overshadowed by his family and friends, yet it is Ron’s heart and humor that have solidified his friendships and given those around him the support they needed to carry through.",

                  "Draco Malfoy" => "Draco Malfoy is the son and only child of Lucius and Narcissa Malfoy and was a student at Hogwarts in the same year as Harry Potter. He is a rival of Harry, actively trying to undermine him in any way he can. Draco has white-blond hair and a pale, pointed face. He owns an eagle owl which made almost daily deliveries of sweets from home.",

                  "Minerva McGonagall" => "Minerva McGonagall was the Transfiguration professor and Deputy Headmistress at Hogwarts for over forty years, and a powerful witch and Animagus. McGonagall has a stern exterior, keeping her classes strictly controlled and following the rules closely, yet has a warm heart and cares deeply for her friends and students.",

                  "Cedric Diggory" => "Cedric Diggory was an extremely handsome boy with gray eyes in Hufflepuff House. In 1993, when he was a Fifth Year, he took over as Captain and Seeker of the Hufflepuff Quidditch team. He was a very good student and a Prefect.",

                  "Cho Chang" => "Cho Chang was a popular, pretty Ravenclaw student in the year above Harry who was his girlfriend for awhile. She loved Quidditch — she was a fan of the Tutshill Tornados since she was six — and was the Seeker for the Ravenclaw Quidditch team.",

                  "Severus Snape" => "Snape was a conundrum to all who know him: sarcastic and hard on his most vulnerable students, yet respected by his colleagues; Dumbledore’s confidante and healer, yet also apparently his murderer.",

                  "Rubeus Hagrid" => "Rubeus Hagrid is a half-giant with shaggy hair and a “wild, tangled beard” who serves as the Keeper of Keys and Grounds, Gamekeeper, and Care of Magical Creatures professor at Hogwarts. He is excessively fond of “interesting creatures” — that anyone else would call fearsome monsters.",

                  "Neville Longbottom" => "Neville Longbottom is the son of Frank and Alice Longbottom, famous and well-liked Aurors who were tortured into madness by the Death Eater Bellatrix Lestrange. The Longbottoms are one of the few pureblood families in the wizarding world. Neville is a staunch friend of Harry Potter’s, and a true Gryffindor.",

                  "Luna Lovegood" => "Luna Lovegood is a witch in Ginny Weasley’s year, a brave member of Dumbledore’s Army and a Ravenclaw, who is considered a bit weird by her classmates. She comes by this reputation honestly: Luna simply isn’t like the other kids at all. She dresses unusually she proclaims her strange beliefs openly, and in some ways she seems to be completely out of touch with what’s going on around her.",

                  "Ginny Weasley" => "Ginny is the youngest child and only daughter of Arthur and Molly Weasley, and the first girl born to the family in several generations. Though consistently underestimated by her family, she is a powerful witch (OP6) and also quite popular. She has bright brown eyes and vivid, flaming red hair, worn as a long mane (very apt for a lion-hearted Gryffindor).",

                  "Sirius Black" => "Sirius Black was the elder of two boys born to an aristocratic family that was fiercely proud of its pureblood status and vehemently anti-Muggle. Unlike his younger brother Regulus and just about all of his ancestors, Sirius was sorted into Gryffindor and rejected his family’s belief in pure-blood supremacy.",

                  "Remus Lupin" => "Remus Lupin was a contemporary of James Potter, Sirius Black and Peter Pettigrew (together they were known as “The Marauders“) and he was appointed as a prefect from his fifth year at Hogwarts School. He became a professor of Defence Against the Dark Arts at during Harry Potter’s third year, but was unable to continue to the following year when it was revealed that he was a werewolf.",

                  "Arthur Weasley" => "Arthur Weasley is an easy-going, middle-aged wizard with a passion for Muggles, and whose dearest ambition is to learn how airplanes fly. Arthur fought, along with the rest of his family, in the Battle of Hogwarts in May, 1998. He and Molly have at least twelve grandchildren, and it is a good bet that one of them likes to tinker in the shed with grandpa.",

                  "Bellatrix Lestrange" => "Bellatrix Lestrange was one of Voldemort’s most devoted Death Eaters, a cruel and vicious woman who was guilty of torturing and murdering wizards and Muggles alike. Bella, as she was sometimes called, was the oldest daughter of Druella Rosier and Cygnus Black of the Noble and Most Ancient House of Black.",

                  "Lord Voldemort" => "Lord Voldemort, born Tom Marvolo Riddle, was the son of Merope Gaunt (a descendent of Salazar Slytherin) and Tom Riddle, a handsome, wealthy Muggle from Little Hangleton whom Merope ensnared with a love potion. When her husband found out she was a witch, he abandoned her while she was pregnant.",

                  "Horace Slughorn" => "Horace Slughorn is a teacher at Hogwarts. He served as Potions Master until 1981, then again from 1996. He was also Head of Slytherin house for the school year 1997-1998. Ever since Voldemort regained his powers, Slughorn had lived in fear that he will be confronted by Death Eaters and pressured to join them. For over a year he constantly moved from place to place, inhabiting the homes of muggles who leave their houses unattended.",

                  "Kingsley Shacklebolt" => "Kingsley Shacklebolt was a highly capable Auror and a member of the Order of the Phoenix. He resisted Voldemort’s takeover of the Ministry in 1997, even appearing on the Potterwatch radio program, and was made Minister of Magic in 1998 after Voldemort’s demise. Kingsley was a tall, bald black wizard who had a deep slow voice and sometimes wore a single gold hooped earring.",

                  "Dolores Umbridge" => "Even from a young age Umbridge was judgemental, prejudiced and sadistic. She had a vehement opposition to part human species including half-giants, werewolves, centaurs and merpeople, stemming from a terror of the unknown and the wild: she persecuted Hagrid for his race, passed legislation against werewolves and campaigned for the captivity of merpeople. Her extreme anti-Muggle and anti-part-human opinions tended to shock even the most pro-pureblood wizards.",

                  "Lucius Malfoy" => "Lucius was a Death Eater during Voldemort’s first “reign of terror.” However after the Dark Lord disappeared, Malfoy “came back saying he’d never meant any of it”. Lucius revived his old allegiances when Voldemort rose to power once again.  Lucius Malfoy used his position in the wizarding world to wield considerable power in the Ministry of Magic.",

                  "Vincent Crabbe" => "Crabbe was the son of a Death Eater and, along with Gregory Goyle, a crony of Draco Malfoy. Crabbe is quite dense, although he seems to be a little brighter than Goyle. Throughout his first six years at Hogwarts, Crabbe and Goyle sycophantically followed Draco Malfoy around and served as something of a bodyguard for him.",

                  "Gregory Goyle" => "Gregory Goyle is one of Draco Malfoy’s thuggish cronies. Goyle has short, bristly hair that extends down onto his forehead. His eyes are small, dull, and deep set, and he speaks with a low, raspy voice. He’s a mean bully who enjoys whatever chance he gets to boss people around, whether as a member of Umbridge’s Inquisitorial Squad in his fifth year or using the Cruciatus Curse on other students in his seventh.",

                  "Argus Filch" => "Argus Filch was the Hogwarts caretaker, a cantankerous, nasty man who detests the students. He knew the secret passageways and hidden doors of Hogwarts better than anyone except Fred and George Weasley (and now Harry, thanks to the Marauders’ Map). Filch was a Squib, which means that he was born of a wizarding family but cannot do magic. The frustration this caused is partly to blame for his horrible and vindictive attitude."
                }


characters.map! do |character|
  character['eyeColour'] = 'brown' if character['eyeColour'] == ''
  character['house'] = 'unknown' if character['house'] == ''
  character = {
    name: character['name'],
    species: character['species'],
    sex: character['gender'],
    house: character['house'],
    eye_color: character['eyeColour'],
    hair_color: character['hairColour'],
    picture_url: character['image'],
    price: (50..150).to_a.sample,
    description: descriptions[character['name']]
  }
end

colin = User.new({username: "colino", password: "picasso96", email: "colin@gmail.com" })
colin.save!
alex = User.new({username: "alex04", password: "picasso96", email: "alex@gmail.com"})
alex.save!
hadrien = User.new({username: "hadri96", password: "picasso96", email: "hadrienmorand@hotmail.com"})
hadrien.save!

characters.each_with_index do |character, index|
  wizard = Wizard.new(character)
  case ((index + 1) % 3)
  when 1
    wizard.user_id = hadrien.id
  when 2
    wizard.user_id = alex.id
  when 0
    wizard.user_id = colin.id
  end
  wizard.save!

end

