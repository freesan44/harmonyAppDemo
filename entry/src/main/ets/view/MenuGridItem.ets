@Component
@Preview
export default struct MenuGridItem{
  title: string = "item";
  imageIcon:  Resource;

  build() {
    Column(){
      Image(this.imageIcon)
        .height(24)
        .width(24)

      Text(this.title)
        .fontSize(16)
        .width('100%')
        .textAlign(TextAlign.Center)
    }
  }
}