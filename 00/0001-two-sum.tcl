
set problem {
  Given an array of integers, return indices of the two numbers such that they add up to a specific target.

  You may assume that each input would have exactly one solution, and you may not use the same element twice.
}

set example {
  Given nums = [2, 7, 11, 15], target = 9,
  
  Because nums[0] + nums[1] = 2 + 7 = 9,
  return [0, 1].
}

proc main {target nums} {
  set idx_a -1
  foreach val_a $nums {
    incr idx_a
    set  val_b  [expr {$target-$val_a}]
    set  idx_b  [ !num_search $nums $val_b $val_a]

    if {$idx_b>=0} {
      return [list $idx_a $idx_b]
    }
  }
  return 
}

proc !num_search {nums val exclude} {
  set matches [lsearch -all -integer $nums $val]

  if {[llength $matches]>0} {
    if {$val!=$exclude} {
      return [lindex $matches 0] 
    } elseif {[llength $matches]>1} {
      return [lindex $matches 1] 
    }
  }

  return -1
}


exit

