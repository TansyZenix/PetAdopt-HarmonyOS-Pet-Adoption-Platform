@Entry
@Component
export struct HomeList {
  @State message: string = 'Hello World';
  @State list:Array<string>=["椅子","椅子","椅子","椅子"]
  build() {
    Flex({wrap:FlexWrap.Wrap,justifyContent:FlexAlign.SpaceBetween}){
      ForEach(this.list,(item:string,index:number)=>{
        Column(){
            Text(item)
        }.width('45%')
        .borderWidth(1)
        .borderColor(Color.Red)
        .height(80)
      })
    }
  }
}