
pow <- function (x=10L, y=2, z=2){
  vec_check <- c(x, y, z)
  # if (is.double(x) || is.integer(x) && (is.double(y) || is.integer(y)) && (is.double(z) || is.integer(z))){
  if (is.numeric(vec_check)){
    print("Checked, processing...", quote = FALSE)
    if (z!=0){
      x**y/z
    } else{
      print("You cannot divide by zero! z = 0 (Error)")
    }
  } else {
    print("Some numbers is not numeric")
  }
}

