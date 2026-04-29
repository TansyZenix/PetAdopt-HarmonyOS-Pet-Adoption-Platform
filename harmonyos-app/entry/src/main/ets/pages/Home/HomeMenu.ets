@Entry
@Component
export struct HomeMenu {
  @State message: string = 'Hello World';
  @State menu:Array<string>=["椅子","椅子","椅子","椅子"]
  build() {
    Row(){
      ForEach(this.menu,(item:string, index:number)=>{
        Column(){
          Image($r('app.media.app_icon')).width(25).height(25)
          Text(item)
        }
      })
    }.justifyContent(FlexAlign.SpaceAround)
  }
}