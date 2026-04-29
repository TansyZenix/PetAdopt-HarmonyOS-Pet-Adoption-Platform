import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct Communication_group_page {

  @Builder
  util_part(img_path:string,title:string,location:string){
    //分界线
    Row() {
    }
    .height(10)
    .width('100%')


    Row() {
      Image($r(img_path))
        .height('60')
        .width('60')
        .borderRadius(10)

      Column() {
        Text(title)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Text(location)
          .fontSize(14)
          .padding({ top: 5 })
      }
      .padding({ left: 15 })

      Blank() // 占据剩余空间，将后面组件推到右侧

      Button('加入', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          // 显示购买成功弹窗
          promptAction.showDialog({
            title: '提示',
            message: '加入成功',
            buttons: [
              {
                text: '确定',
                color: '#317aff' // 可选：设置按钮颜色
              }
            ]
          }).then((data) => {
            if (data.index === 0) {
              // 用户点击了确定按钮
              console.log('用户确认购买');
            }
          });
        })
    }
    .width('100%') // 关键：让Row撑满父容器，Blank才能正确计算剩余空间
    .backgroundColor('#FFFFFF')
    .padding({
      top: 10,
      right: 10,
      bottom: 10,
      left: 10
    })
  }

  @Builder
  ContentBuilder() {
    Column() { //最外层
      this.util_part('app.media.zaizai01','总寻宠寻主群','全国')
      this.util_part('app.media.zaizai02','宠物领养救助交流群','四川省-成都市')
      this.util_part('app.media.zaizai03','成都猫咪救助中心','四川省-成都市')
      this.util_part('app.media.zaizai04','成都狗狗救助中心','四川省-成都市')
      this.util_part('app.media.zaizai05','成都大西瓜救助中心','四川省-成都市')

      //没有更多了
      Text('—— 没有更多了 ——').textAlign(TextAlign.Center).padding({top:10})
    }.backgroundColor('#F5F5F5')
    .height('100%')
    .width('100%')
  }

  build() {
    Column() {
      Stack() {
        Row() {
          // 1. 固定导航栏（位于Stack上层）
          // 左侧城市选择
          Row() {
            Image($r('app.media.back'))
              .width(20)
              .height(20)
            Text(' 返回')
              .font({ size: 14, weight: FontWeight.Bold })
          }.onClick(() => {
            router.back();
          })
          .padding({ left: 10, top: 15, bottom: 15 })
          .backgroundColor('#FFFFFF')

          // 中间标题
          Text('宠友群')
            .font({ size: 16, weight: FontWeight.Bold })
            .flexGrow(1)
            .textAlign(TextAlign.Center)

          // 右侧菜单按钮
          Image($r('app.media.youshangjiao'))
            .width(90)
            .height(24)
        }
        .width('100%')
        .backgroundColor('#FFFFFF')
        .align(Alignment.Top) // 固定到顶部
        .zIndex(1) // 确保导航栏位于最上层
      }

      this.ContentBuilder();

    }
  }
}