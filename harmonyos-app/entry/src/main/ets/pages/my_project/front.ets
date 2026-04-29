import { deliver } from './publish/deliver'
import { MyPage } from './account/MyPage'
import { Main_page } from './main_page'
import { BarItem } from '../../types/index'
import { Community } from './community/community'

@Entry
@Component
struct Main {
  @State selected:number = 1; //下标
  // { icon:'' , icon_sel:'', text:'', id:''}
  @State toolBarList:BarItem[]=[
    {icon:$r('app.media.1'),sel_icon:$r('app.media.s1'),text:'首页',id:1},
    {icon:$r('app.media.2'),sel_icon:$r('app.media.s2'),text:'发布',id:2},
    {icon:$r('app.media.3'),sel_icon:$r('app.media.s3'),text:'社区',id:3},
    {icon:$r('app.media.4'),sel_icon:$r('app.media.s4'),text:'我的',id:4}
  ]
  @Builder toolBarConfig(){
    Row(){
      ForEach(this.toolBarList,(item:BarItem,index:number)=>{
        Column({space:5}) {
          Image(this.selected==item.id?item.sel_icon:item.icon).width(24).height(40).borderRadius(10)
        }.onClick(()=>{
          this.selected = item.id;
        })
      })

    }.width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .padding({top:15})


  }
  build() {
    Column() {
      Navigation(){
        if(this.selected==1){
          Main_page()
        }else if(this.selected==2){
          deliver()
        }else if(this.selected==3){
          Community()
        }else if(this.selected==4){
          MyPage()
        }
      }.toolbarConfiguration(this.toolBarConfig()).hideTitleBar(true)
    }.backgroundColor('#FFFFFF')
    .height('100%')
    .width('100%')
    .margin({bottom:0})
  }
}