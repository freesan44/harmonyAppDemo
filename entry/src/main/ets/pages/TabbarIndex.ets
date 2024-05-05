import CardModel from "../viewModel/CardModel"
import DimensionUtil from "../common/utils/DimensionUtil"
import CommonConstants from "../common/constants/CommonConstants"
import HomeIndex from "../pages/HomeIndex"
import LeftIndex from "../pages/LeftIndex"
/**
 * Navigation path on the home page.
 */
@Entry
@Component
struct TabIndex {
  @State currentPage: number = 2;

  @Builder TabBuilder(item: CardModel, index: number | undefined) {
    Column() {
      Image(this.currentPage === index ? item.selectedIcon : item.defaultIcon)
        .width(20)
        .height(20)
        .objectFit(ImageFit.Contain)
      Text(item.content)
        .fontColor(this.currentPage === index ? Color.Orange : Color.Black)
        .fontSize(12)
        // .margin({ top: 1 })
        .opacity(this.currentPage === index
          ? 1
          : 0.6)
    }
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentPage }) {
      ForEach(CommonConstants.INDEX_TAB, (item: CardModel, index: number | undefined) => {
        TabContent() {
          if (index === 0) {
            HomeIndex()
            // FileManagerIndex()
          }
          else if(index === 2) {
            LeftIndex()
          }
        }
        .tabBar(this.TabBuilder(item, index))
      }, (item: CardModel) => JSON.stringify(item))
    }
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentPage = index;
    })
  }
}