
pow <- function (x=10L, y=2, z=2){
  if (is.double(x) || is.integer(x) && (is.double(y) || is.integer(y)) && (is.double(z) || is.integer(z))){
    if (z!=0){
      x**y/z
    } else{
      print("Делить на ноль нельзя! Dont")
    }
  } else {
    print("0")
  }
}

