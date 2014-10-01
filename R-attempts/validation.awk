
$9 > 29 { print $0, " is more than 29 years old, classes aren't sufficient" }
#$9 < 5 { print $0, " witnesses the existence of the first 0-4 inclusive class" }
NF != 9 { print $0, " mismatch the expected number of fields" }
!($1 == "M" || $1 == "F" || $1 == "I") { print $0, " has a not expected Sex factor" }
