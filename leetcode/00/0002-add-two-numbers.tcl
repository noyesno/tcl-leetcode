set problem {
  You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
  
  You may assume the two numbers do not contain any leading zero, except the number 0 itself.
}


set example {
  Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
  Output: 7 -> 0 -> 8
  Explanation: 342 + 465 = 807.
}

proc main {digits_a digits_b} {
  set result [list]
  set carry 0
  foreach d1 $digits_a d2 $digits_b {
    if {$d1 eq ""} { set d1 0}
    if {$d2 eq ""} { set d2 0}

    set sum   [expr {$d1+$d2+$carry}]
    set carry [expr {$sum/10}]
    lappend result [expr {$sum%10}]
  }

  return $result
}
