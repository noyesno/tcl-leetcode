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
  foreach pattern $testcase {
    lassign $pattern input output
    set result [main $input]

    if {$result eq $output} {
      puts [list "PASS:" $output <- $input]
    } else {
      puts [list "FAIL:" [list $output <- $input]]
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
