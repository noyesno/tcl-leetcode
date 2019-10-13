set problem {
  Given a string, find the length of the longest substring without repeating characters.
}

proc find_char {text char} {
  return [string first $char $text]
}

proc longest_head {text} {
  set substr [list]
  foreach char [split $text ""] {
    if {[find_char $substr $char]>=0} break
    append substr $char
  }
  return $substr
}

proc skip_head {text substr} {
  set next_char [string index $text [string length $substr]]
  if {$next_char eq ""} {
    return ""
  } else {
    set pos [find_char $substr $next_char]
    return [string range $text $pos+1 end]
  }
}

proc main {text} {
  set max_substr ""

  while {$text ne ""} {
    set substr [longest_head $text]
    if {[string length $substr]>[string length $max_substr]} {
      set max_substr $substr
    }
    set text [skip_head $text $substr]
  }


  return $max_substr
}

