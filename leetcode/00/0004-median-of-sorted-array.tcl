
set problem {
  There are two sorted arrays nums1 and nums2 of size m and n respectively.

  Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

  You may assume nums1 and nums2 cannot be both empty.
}

proc main {nums1 nums2} {

  if {[llength $nums1] > [llength $nums2]} {
    lassign [list $nums1 $nums2] nums2 nums1
  }

  set lower 0
  set upper [llength $nums1]
  set size [expr {([llength $nums1]+[llength $nums2]+1)/2}]

  while 1 {
    set i [list_exploration $nums1 $lower $upper]
    set j [expr {$size-$i}]

    if {$i<[llength $nums1] && [lindex $nums1 $i] < [lindex $nums2 $j-1]} {
      set lower [expr {$i+1}]
    } elseif {$i>0 && [lindex $nums1 $i-1] > [lindex $nums2 $j]} {
      set upper [expr {$i-1}]
    } else {
      return [calculate $nums1 $i $nums2 $j]
    }
  }
}

proc list_exploration {list lower upper} {
  set mid [expr {($lower+$upper)/2}]
  return $mid
}


proc calculate {nums1 mid nums2 j} {
    if {$mid==0} {
      set left [lindex $nums2 $j-1]
    } elseif {$j==0} {
      set left [lindex $nums1 $mid-1]
    } else {
      set left [expr {max([lindex $nums1 $mid-1], [lindex $nums2 $j-1])}]
    }

    if {([llength $nums1]+[llength $nums2])%2} {
      return $left
    }

    if {$mid==[llength $nums1]} {
      set right [lindex $nums2 $j]
    } elseif {$j==[llength $nums2]} {
      set right [lindex $nums1 $mid]
    } else {
       set right [expr {max([lindex $nums1 $mid], [lindex $nums2 $j])}]
    }

    return [expr {($left+$right)/2.0}]
}


return

# exploitaion
# exploration

