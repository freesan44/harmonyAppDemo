@Component
@Preview
export default struct HomeTopSlider {
  @Prop sliderValue:number;
  @Prop sliderMaxValue:number;
  // sliderChangeValue:number = 100;
  // contrast(sliderValue:number){
  //   this.sliderValue = sliderValue;
  // }
  build(){
    Row(){
      Button('测试按钮')
        .width('20%')
        .backgroundColor(Color.Green)
        .onClick(()=>{

        })
        // .onClick(()=>{
        //   // this.testMethod();
        // })
      Slider({
        value:this.sliderValue/this.sliderMaxValue * 100
      })
        .showTips(true)
        .width('65%')
        .onChange((value: number, mode: SliderChangeMode)=>{
          console.info('123+'+value.toString())
          // this.sliderChangeValue = value;
        })
      Text((this.sliderValue/this.sliderMaxValue * 100).toFixed(0))
        .width('20%')
      // Slider(){
      //
      // }
    }
    .height(50)
  }
}
