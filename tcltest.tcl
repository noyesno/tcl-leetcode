#!/usr/bin/env tclsh


#----------------------------------------------------------------------#

proc read_text {fpath} {
  set fp [open $fpath]
  set text [read $fp]
  close $fp
  return $text
}

proc load_solution {tclfile} {
  global problem testcase

  source $tclfile
}

proc load_testcaes {tclfile} {
  global testcase

  if {![info exist testcase]} {
    set testcase [read_text $tclfile.test]
  }
}

proc print_problem {tclfile} {
  global problem

  puts "%% tcltest $tclfile"
  puts $problem
}

proc print_testcase {} {
  global testcase

  puts "---"
  foreach case $testcase {
    set input  [lrange $case 0 end-1]
    set output [lindex $case end]

    set result [main {*}$input]

    if {$result eq $output} {
      puts "PASS: [list $output] <- $input"
    } else {
      puts "FAIL: [list $result] <- $input"
    }
  }
  puts "---"
}

#----------------------------------------------------------------------#

lassign $argv tclfile 

load_solution $tclfile
load_testcaes $tclfile


print_problem $tclfile
print_testcase
