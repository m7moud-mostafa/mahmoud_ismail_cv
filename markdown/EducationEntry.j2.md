## <<entry.institution>>, ((* if entry.degree *))<<entry.degree>> of ((* endif *))<<entry.area>>

((* if entry.date_string *))- <<entry.date_string>>
((* endif *))
((* if entry.location *))- <<entry.location>>
((* endif *))
((* for item in entry.highlights *))
- <<item>>
((* endfor *))
