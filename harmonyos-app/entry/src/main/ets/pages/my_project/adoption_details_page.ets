import router from '@ohos.router';
import { animal, BarItem, pet_responseType } from '../../types/index'
import { get } from '../../services/request'

@Entry
@Component
struct Adoption_details_page {
  @State pet_id: object = router.getParams() //router.getParams()?.['pet_id'];
  @State res: pet_responseType<animal> = { code: 0, message: '' };
  @State cur_page_data: animal | undefined = {
    _id: "",
    icon: "", //url 头像
    title: "", //
    age: "", //
    sex: "",
    pet_location: "",
    pet_describe: "",
    pet_class: "", //流浪救助/家养宠物
    jieZhong: "", // 未接种/已接种/不详
    quChong: "", // 已驱虫/未驱虫/不详
    jueYu: "", // 已绝育/未绝育/不详
    story: "", //故事
    adopt_condition: "", //领养条件
    adopt_way: "", //领养方式
  };


  @Builder
  ContentBuilder() {
    Scroll(){
      Column() {
        Image(this.cur_page_data?.icon)
          .height('200')
          .borderRadius(8)
          .padding({
            left: 20,
            right: 20,
            top: 10,
            bottom: 10
          })
          .objectRepeat(ImageRepeat.X)
        Column() { //整体
          Column(){//上面的部分 (名字，年龄，性别，是否绝育，去重，接种，地址)
            // 标题（最大字号）
            Text(`${this.cur_page_data?.title}`)
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .margin({ bottom: 10 })
              .maxLines(2)
              .textAlign(TextAlign.Center)

            Text(`${this.cur_page_data?.age} | ${this.cur_page_data?.sex}`)
            // 医疗信息行（黄色底）
            Row() {
              Text(`${this.cur_page_data?.jieZhong}`)
                .padding({
                  left: 12,
                  right: 8,
                  top: 6,
                  bottom: 6
                })
                .backgroundColor('#fffbe6')
                .borderRadius(20)// 胶囊形圆角
                .margin({ right: 10 })
                .fontSize(14)

              Text(`${this.cur_page_data?.quChong}`)
                .padding({
                  left: 12,
                  right: 8,
                  top: 6,
                  bottom: 6
                })
                .backgroundColor('#fffbe6')
                .borderRadius(20)
                .margin({ right: 10 })
                .fontSize(14)

              Text(`${this.cur_page_data?.jueYu}`)
                .padding({
                  left: 12,
                  right: 8,
                  top: 6,
                  bottom: 6
                })
                .backgroundColor('#fffbe6')
                .borderRadius(20)
                .fontSize(14)
            }.padding({top:10,bottom:10})

            //地址:
            Text(`${this.cur_page_data?.pet_location}`)
              .padding({
                left: 12,
                right: 8,
                top: 6,
                bottom: 6
              })
              .backgroundColor('#fffbe6')
              .borderRadius(12)
              .fontSize(14)
          }.margin({top:10})
          .padding({ top: 10,right:10,left:10,bottom:10 })
          .alignItems(HorizontalAlign.Center)
          .backgroundColor('#F7C96B')
          .borderRadius(12)

          //分界线
          Row() {
          }
          .height(10)
          .width('100%')
          Divider();
          Divider();

          Column() { //下面的部分 (故事、条件和领养方式)
            Text('⭐Ta的故事⭐')
              .fontSize(16)

            Text(`        ${this.cur_page_data?.story}`)
              .fontSize(14)
              .maxLines(4)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .padding({top:3})

          }.margin({top:10})
          .padding({ top: 10,right:10,left:10,bottom:10 })
          .alignItems(HorizontalAlign.Start)
          .backgroundColor('#F7C96B')
          .borderRadius(12)

          //分界线
          Row() {
          }
          .height(10)
          .width('100%')

          Divider();
          Divider();

          Column(){
            Text('⭐领养条件⭐')
              .fontSize(16)

            Text(`        ${this.cur_page_data?.adopt_condition}`)
              .fontSize(14)
              .maxLines(4)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .padding({top:3})
          }.margin({top:10})
          .padding({ top: 10,right:10,left:10,bottom:10 })
          .alignItems(HorizontalAlign.Start)
          .backgroundColor('#F7C96B')
          .borderRadius(12)

          //分界线
          Row() {
          }
          .height(10)
          .width('100%')

          Divider();
          Divider();

          Column(){
            Text('⭐领养方式⭐')
              .fontSize(16)

            Text(`        ${this.cur_page_data?.adopt_way}`)
              .fontSize(14)
              .maxLines(4)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .padding({top:3})
          }.margin({top:10})
          .padding({ top: 10,right:10,left:10,bottom:10 })
          .alignItems(HorizontalAlign.Start)
          .backgroundColor('#F7C96B')
          .borderRadius(12)
        }

      }.padding({ left: 20, right: 20 })

    }.height('100%')
    .margin({bottom:70})
  }

  async aboutToAppear(): Promise<void> {
    // let result = await get(`/mypet/getPetById/?_id=67dac1316da0811f4a0e795b`)
    let result = await get(`/mypet/getPetById/?_id=${this.pet_id['pet_id']}`)
    this.res = JSON.parse(result);
    this.cur_page_data = this.res.data;
    console.log('', this.cur_page_data?.title)
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
          Text('领养详情')
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
    .height('100%')
    .backgroundColor('#FAB17A')
  }
}