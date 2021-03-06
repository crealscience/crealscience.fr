<!-- Xavier-Laurent Salvador -->
for $x in db:open(
  "<DBSECRET>"
)//entry[./nom="<NOM>"][./mdp="<MDP>"] return "OK"
#
(
  for $x in db:open(
    "<DBSECRET>"
  )//entry[./nom="<NOM>"] return data(
    $x/groupe
  )
)[1]
#
data(
  for $x in db:open(
    "<DBSECRET>"
  )//entry return <x>{
    data(
      $x/nom
    )
  },</x>
)
#
(:3:)
let $x := <entry><nom><NEWUSER></nom><mdp><NEWMDP></mdp><groupe><NEWGROUPE></groupe><mail><NEWMAIL></mail><journal><date n="in"></date><date n="out"></date><lock>OUT</lock></journal></entry> return insert node $x into root(
  db:open(
    "utilisateur"
  )
)
#
(:4:)
(
  for $x in db:open(
    "<DBSECRET>"
  )//entry[./nom="<NOM>"] return data(
    $x/mail
  )
)[1]
#
(:5:)
for $x in db:open(
  "<BASE>"
)//entry[./nom="<DELUSR>"] return delete node $x
#
(:6:)
for $x in db:open(
  "<BASE>"
)//entry[.//id="<VALID>"] return <x>{
  $x//orth
}{
  $x//sense
}{
  $x//id
}</x>
#
(:7:)
for $x in db:open(
  "<BASE>"
)//entry[.//id="<ID>"] return delete node $x
#
(:8:)
for $x in db:open(
  "<BASE>"
)//entry[.//id="<ID>"]//orth return data(
  $x
)
#
(:9:)
for $x in db:open(
  "<BASE>"
)//entry[.//id="<ID>"]//valid return replace value of node $x with "true"
#
(:10:)
for $x in db:open(
  "<BASE>"
)//entry[.//id="<ID>"] return delete node $x
#
(:11:)
for $x in db:open(
  "<BASE>"
)//entry[.//orth="<ORTH>"][starts-with(
  .//orth,"<ORTH>"
)][ends-with(
  .//orth,"<ORTH>"
)][not(
  .//id=<ID>
)] return delete node $x
#
(:12:)
for $x in db:open(
  "<BASE>"
)//entry[.//nom="<NOM>"][.//mdp="<MDP>"]//mdp return replace value of node $x with "<NMDP>"
#
(:13:)
for $x in db:open(
  "<BASE>"
)//entry[.//id="<ID>"]//auteur return data(
  $x
)
