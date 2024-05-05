import http from '@ohos.net.http';
import ResponseCode from '@ohos.net.http';
import image from '@ohos.multimedia.image';
import MenuGridItem from '../view/MenuGridItem'

@Component
@Preview
export default struct LeftIndex{
  itemArr: string[] = ['账户管理','商城','活动','网易严选','积分专区','缴费','全部']
  iconUrlArr: string[] = [
  'https://ebankcdn.gdrcu.com/liebao-bucket/szxyx_sh_jfzq_1_144x144.png',
  'https://ebankcdn.gdrcu.com/liebao-bucket/szxyx_sh_jfzq_2_144x144.png',
  'https://ebankcdn.gdrcu.com/liebao-bucket/szxyx_sh_jfzq_3_144x144.png',
]
  build(){
    Scroll(){
      Column(){
        //顶部广告图
        this.topPic()
        //图标
        Grid(){
          ForEach(this.itemArr, (item:string) =>{
            GridItem(){
              MenuGridItem(
                {title:item,
                  imageIcon:$r('app.media.ic_tab_main_default')
                })
            }
          }, item => item.toString())
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .height(130)
        // .backgroundColor(Color.Green)
        // Blank(10)
        this.ADView()
        Row(){
          Text('积分专区')
            .fontColor(Color.Black)
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
            .fontSize(18)
            .width('100%')
        }
        .padding({left : 12})
        .margin({top:10,bottom:10})

        //积分专区广告
        Grid(){

          ForEach(['洗衣液','芒果干','湿纸巾'],(item,index)=>{
            GridItem(){
              this.jifenItem(this.iconUrlArr[index],item)
            }
          },item => item.toString())

        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr')
        .columnsGap(3)
        .width('95%')
        .height(140)

        Row(){
          Text('政务服务')
            .fontColor(Color.Black)
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
            .fontSize(18)
            .width('100%')
        }
        .padding({left : 12})
        .margin({top:10,bottom:10})
        //政务专区
        this.zhengwuGrid()
        Blank(30)
      }
      .width('100%')
      // .height('100%')
      // .padding({top:-100})
      // .align(Alignment.Top)
    }

  }

  //政务服务
  @Builder
  zhengwuGrid(){
    Grid(){
      GridItem(){
        Image('https://ebankcdn.gdrcu.com/liebao-bucket/shenghuo_zhengwu_shebaoka@2x.png')
          .objectFit(ImageFit.Fill)
      }
      .rowStart(0)
      .rowEnd(1)
      GridItem(){
        Image('https://ebankcdn.gdrcu.com/liebao-bucket/shenghuo_zhengwu_shebaoka@2x.png')
          .objectFit(ImageFit.Fill)
      }
      GridItem(){
        Image('https://ebankcdn.gdrcu.com/liebao-bucket/shenghuo_zhengwu_shebaoka@2x.png')
          .objectFit(ImageFit.Fill)
      }
      // .rowStart(0)
      // .rowEnd(1)
    }
    .columnsGap(10)
    .rowsGap(7)
    .columnsTemplate('1fr 1fr')
    .rowsTemplate('1fr 1fr')
    .width('95%')
    .height(200)
  }
  //顶部广告图
  @Builder
  topPic(){
    Image('https://ebankcdn.gdrcu.com/liebao-bucket/lijimiantiao_1223.jpg')
      .width('100%')
      // .align(Alignment.Top)
  }

  @Builder
  jifenItem(iconUrl:string,title:string){
    Column(){
      Image(iconUrl)
        .objectFit(ImageFit.Contain)
        // .backgroundColor(Color.Green)
        .height('70%')
        .padding({bottom : 3})
        .borderRadius(7)
      Text(title)
        .height('20%')
      Text('1000积分起')
        .fontColor(Color.Red)
        .fontSize(10)
        .height('10%')
        // .padding({top : 5})
        // .margin({top : 5})
    }

  }
  //两广告图
  @Builder
  ADView(){
    Row(){
      Image('https://ebankcdn.gdrcu.com/liebao-bucket/shenghuo_banner_bg_1@2x.png')
        .width(160)
        .height(65)
        .objectFit(ImageFit.Fill)
      Image('https://ebankcdn.gdrcu.com/liebao-bucket/shenghuo_banner_bg_1@2x.png')
        .width(160)
        .height(65)
        .objectFit(ImageFit.Fill)
    }
    .width('90%')
    .height(60)
    .justifyContent(FlexAlign.SpaceAround)
  }
  getImage(url:string){
    let httpRequest = http.createHttp();
    httpRequest.request(url,(err, data)=>{
      if (err) {
        console.log(err.toString());
      }
      else {
        let code = data.responseCode;
        if (code == ResponseCode.ResponseCode.OK) {
          let res:any = data.result
          let imageSource = image.createImageSource(res)

        }
      }
    })
  }
}