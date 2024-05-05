import '../view/HomeTopSlider'
import HomeTopSlider from '../view/HomeTopSlider';
@Component
@Preview
export default struct HomeIndex {
  @State timeLeft : number = 10;
  @State maxTime : number = 10;
  private clock ;
  // 横进度条
  @Builder
  slideBuild(){
    Row(){
      Button('测试按钮')
        .width('20%')
        .backgroundColor(Color.Green)
        .onClick(()=>{
          this.testMethod();
        })
      Slider()
      // Slider(){
      //
      // }
    }
    .height(50)

  }

  //下排组件按钮
  @Builder
  bottomButtonBulild(){
    Row(){
      Button("暂停")
        .onClick(()=>{
          this.countDownStop();
        })
      Button('开始')
        .onClick(()=>{
          this.conuntDown();
        })
      Button('重置')
        .onClick(()=>{
          this.countDownReset();
        })
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('80%')
  }

  build() {
    Column(){
      HomeTopSlider({sliderValue:this.timeLeft,sliderMaxValue:this.maxTime});
      // this.slideBuild();
      Text(this.updateTimerDisplay(this.timeLeft))
        .height(350)
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontSize(100)
        .fontColor(Color.Blue)
      this.bottomButtonBulild();
    }
    .height('100%')
  }

  //更新时间
  updateTimerDisplay(time:number):string{
    let minutes  = Math.floor(time / 60);//取整
    let seconds  = time%60;
    let res: string = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    return res;
  }
  //开始计时
  conuntDown(){
    if (this.clock) {
      return;
    }
    this.clock = setInterval(()=>{//计时器
      if (this.timeLeft <=0) {
        clearInterval(this.clock)
        this.clock = null;
        return;
      }
      this.timeLeft --;
    },1000)
  }
  countDownStop(){
    if (this.clock) {
      clearInterval(this.clock);
      this.clock = null;
    }
  }
  countDownReset(){
    if (this.clock) {
      clearInterval(this.clock);
      this.clock = null;
    }
    this.timeLeft = 25*60;
    this.maxTime = 25*60;
  }
  testMethod(){
    let time = 25*60;
    let minutes  = Math.floor(time / 60);//取整
    let seconds  = time%60;
    let res: string = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    console.log(res);
  }
}