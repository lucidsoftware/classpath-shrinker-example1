package foo

object Foo {
  def main(args: Array[String]): Unit = {
    import cats.implicits._
    println(true === false)
  }
}
