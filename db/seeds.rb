departments = [

{nys_acct: "101-00", category: "STORY & RIGHTS"},

{nys_acct: "103-00", category: "WRITING"},

{nys_acct: "105-00", category: "PRODUCER & STAFF"},

{nys_acct: "107-00", category: "DIRECTOR & STAFF"},

{nys_acct: "109-00", category: "TALENT & STAFF"},

{nys_acct: "111-00", category: "TRAVEL & LIVING Above the Line"},

{nys_acct: "112-00", category: "FRINGE BENEFITS (ATL)"},

{nys_acct: "113-00", category: "PRODUCTION STAFF"},

{nys_acct: "115-00", category: "EXTRA TALENT"},

{nys_acct: "117-00", category:"CAMERA"},

{nys_acct: "119-00", category:"SET DESIGN"},

{nys_acct: "121-00", category:"SET CONSTRUCTION"},

{nys_acct: "123-00", category:"SPECIAL EFFECTS"},

{nys_acct: "125-00", category:"SET OPERATIONS"},

{nys_acct: "127-00", category:"ELECTRICAL"},

{nys_acct: "129-00", category:"SET DRESSING"},

{nys_acct: "131-00", category:"ACTION PROPS"}

]


 departments.each do |department_hash|
   Department.find_or_create_by(department_hash)
 end
