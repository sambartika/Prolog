occupation(joe,oral_surgeon).
occupation(sam,patent_laywer).
occupation(bill,trial_laywer).
occupation(cindy,investment_banker).
occupation(joan,civil_laywer).
occupation(len,plastic_surgeon).
occupation(lance,heart_surgeon).
occupation(frank,brain_surgeon).
occupation(charlie,plastic_surgeon).
occupation(lisa,oral_surgeon).

address(joe,houston).
address(sam,pittsburgh).
address(bill,dallas).
address(cindy,omaha).
address(joan,chicago).
address(len,college_station).
address(lance,los_angeles).
address(frank,dallas).
address(charlie,houston).
address(lisa,san_antonio).

salary(joe,50000).
salary(sam,150000).
salary(bill,200000).
salary(cindy,140000).
salary(joan,80000).
salary(len,70000).
salary(lance,650000).
salary(frank,85000).
salary(charlie,120000).
salary(lisa,190000).

surgeon(X) :- occupation(X,oral_surgeon).
surgeon(X) :- occupation(X,plastic_surgeon).
surgeon(X) :- occupation(X,heart_surgeon).
surgeon(X) :- occupation(X,brain_surgeon).

state(houston,texas).
state(dallas,texas).
state(college_station,texas).
state(pittsburgh,pennsylvania).
state(omaha,nebraska).
state(chicago,illinois).
state(los_angeles,california).
state(san_antonio,california).

texas_rich_surgeon(X) :- surgeon(X), salary(X,Y), Y >100000, address(X,M), state(M,texas).
