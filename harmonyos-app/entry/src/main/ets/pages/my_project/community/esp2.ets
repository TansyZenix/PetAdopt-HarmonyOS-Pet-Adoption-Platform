import { it } from "@ohos/hypium";
import {get} from './../../../services/request'
import { url } from "@kit.ArkTS";
import { router} from '@kit.ArkUI'

//救助
interface  responseType{
  code:number,
  message:string,
  data?:Item[]
}

interface  Item{
  userName:string,
  title:string,
  picture:string,
  time:string
  avatar:string,
  tag:string,
  text:string
}

@Entry
@Component
export struct esp2 {
  @State message: string = 'Hello World';
  @State res:responseType | null=null;

  async aboutToAppear(){
    let result =await get('/community')
    console.log("result",result)
    this.res=JSON.parse(result);
  }
  build(){
    Stack(){
      Column(){
        if (this.res==null){
          Text('当前没有数据')
        }else{
          List({space:10}){
            ForEach(this.res.data ?? [] ,(item: Item, index: number)=>{
              if (item.tag === "救助") {
                ListItem() {
                  Column() {
                    //头像
                    Row() {
                      Image(item.avatar)
                        .width(40)
                        .height(40)
                        .borderRadius(20)
                      Text(item.tag)
                        .textAlign(TextAlign.Center)
                        .width(40)
                        .fontSize(12)
                        .height(20)
                        .backgroundColor(Color.Orange)
                        .opacity(0.6)
                        .borderRadius(4)
                    }
                    .justifyContent(FlexAlign.SpaceBetween)
                    .width('100%').margin({ bottom: 3 })

                    // 标题
                    Text(item.title).fontSize(16).height(16)
                    // 时间
                    Text(item.time).opacity(0.5).fontSize(12).margin({ top: 5 })
                    // 评论内容
                    Text(item.text).fontSize(14).padding({ top: 2, bottom: 2 })
                    // 评论图片
                    Grid() {
                      if (item.picture.indexOf(',') > -1) {
                        ForEach(item.picture.split(','), (itemStr: string) => {
                          GridItem() {
                            Image(itemStr).width(90).height(90).margin({ top: 2 }).borderRadius(10)
                          }
                        })
                      } else {
                        GridItem() {

                          Image(item.picture).width(90).height(90).margin({ top: 2 }).borderRadius(10)
                        }
                      }

                    }.columnsTemplate('1fr 1fr 1fr')
                  }.alignItems(HorizontalAlign.Start)
                }.padding(15).margin({ bottom: 10 }).backgroundColor(Color.White).borderRadius(15)
              }
            })
          }.scrollBar(BarState.Off)
          .width('100%')
        }

      }
      .height('100%')
      .width('100%')
      .padding(20)
      .backgroundColor('#e0e0e0')
      Image($r('app.media.add')).width(50).height(50).backgroundColor(Color.Orange).opacity(0.7).borderRadius(25).position({right:50,top:'80%'})
        .onClick(()=>{
          router.pushUrl({url:'pages/my_project/community/postMessage'})
        })
    }

  }
}