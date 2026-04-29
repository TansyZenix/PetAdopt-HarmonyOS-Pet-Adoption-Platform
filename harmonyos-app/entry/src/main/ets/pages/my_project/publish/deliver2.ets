import router from '@ohos.router';
import {post}from './../../../services/request'
import {promptAction} from '@kit.ArkUI'
@Entry
@Component
 export  struct FindPetPage {
  @State petName: string = '';
  @State petTitle:string='';
  @State petCategory: string = '猫猫';
  @State petGener: string = '男孩';
  @State petAge: string = '';
  @State rewardAmount: string = '';
  @State lostTime: string = '';
  @State lostLocation: string = '';
  @State lostDetails: string = '';
  @State contactPublisher: string = '小可爱791840';
  @State contactPhone: string = '';
  @State contactWechat: string = '';
  @State contactQQ: string = '';
  @State showPhone: boolean = false;
  @State agreedProtocol: boolean = false;
  @State faceToFace: boolean = false;


  handleCheckboxChange1(value: boolean) {
    this.showPhone = value;
  }
  async submitData() {
    let params = JSON.stringify({
      petTitle: this.petTitle,
      petCategory: this.petCategory,
      petName: this.petName,
      petGener: this.petGener,
      petAge: this.petAge,
      rewardAmount: this.rewardAmount,
      lostTime: this.lostTime,
      lostLocation: this.lostLocation,
      lostDetails: this.lostDetails,
      contactPublisher: this.contactPublisher,
      contactPhone: this.contactPhone,
      contactWechat: this.contactWechat,
      contactQQ: this.contactQQ,
      showPhone: this.showPhone,
      faceToFace:this.faceToFace
    });

    let result = await post('http://localhost:3000/deliver2/deliver2', params);
    let code: number = JSON.parse(result).code;
    if (code == 201) {
      promptAction.showToast({
        message: '上传成功',
        duration: 2000,
      });
      router.pushUrl({ url: 'pages/my_project/publish/test02' });
    } else {
      promptAction.showToast({
        message: '上传失败',
        duration: 2000,
      });
    }
  }



  build() {
    Scroll() {
      Column({ space: 5 }) {

        Row(){
          Image($r('app.media.img_2'))
            .margin({ right: 15,bottom:15 })
            .width(24)
            .height(24)
            .onClick(() => {
              router.back()
            })
          // 标题部分
          Text("发布寻宠信息")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .padding({ bottom: 16 ,left:80})
        }
        // 宠物照片部分
        Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
        Text("宠物照片")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)}
        Column() {
          Image($r('app.media.img'))
            .width(40)
            .height(40)
          Text("添加图片")
            .fontSize(12)
        }
        .backgroundColor('#F6F7FC')
        .padding(15)
        .alignItems(HorizontalAlign.Start)

        // 宠物视频部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("宠物视频")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        Column() {
          Image($r('app.media.img_1'))
            .width(40)
            .height(40)
          Text("添加视频")
            .fontSize(12)
        }
        .backgroundColor('#F6F7FC')
        .padding(15)
        .alignItems(HorizontalAlign.Start)

        // 领养标题部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("寻宠标题")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        TextInput({ placeholder: '请输入' })
          .backgroundColor('#F6F7FC')
          .border({ width: 2, color: '#E0E0E0', radius: 4 })
          .fontSize(14)
          .placeholderColor('#909090')
          .onChange((v)=>{this.petTitle = v})

        // 分类部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("分类")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Button("猫猫")
            .width(120)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.petCategory === '猫猫' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.petCategory = '猫猫')
          Button("狗狗")
            .width(120)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.petCategory === '狗狗' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.petCategory = '狗狗')
          Button("其他")
            .width(120)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.petCategory === '其他' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.petCategory = '其他')
        }
        .padding({ top: 8 })

        //宠物名字
        // 宠物昵称部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
          Text("宠物昵称")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .padding({ top: 16, bottom: 8 })}
        TextInput({ placeholder: '请输入昵称' })
          .backgroundColor('#F6F7FC')
          .border({ width: 2, color: '#E0E0E0', radius: 4 })
          .fontFamily('Nuntio sans')
          .fontSize(14)
          .lineHeight(20)
          .letterSpacing(0)
          .placeholderColor('#909090')
          .onChange((v)=>{this.petName = v})


        // 宠物性别部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("宠物性别")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Button("男孩")
            .width(120)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.petGener === '男孩' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.petGener = '男孩')
          Button("女孩")
            .width(120)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.petGener === '女孩' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.petGener = '女孩')
          Button("未知")
            .width(120)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.petGener === '未知' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.petGener = '未知')
        }

        // 宠物年龄部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("宠物年龄")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        TextInput({ placeholder: '请输入' })
          .backgroundColor('#F6F7FC')
          .border({ width: 2, color: '#E0E0E0', radius: 4 })
          .fontSize(14)
          .placeholderColor('#909090')
          .onChange((v)=>{this.petAge = v})

        // 悬赏金额部分
        Row(){
            Text("")
              .width(4)
              .height(18)
              .backgroundColor("#FFCB45")
              .margin({ right: 8 })
          Text("悬赏金额")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ right: 200 })
          Toggle({ type: ToggleType.Switch, isOn: this.faceToFace })
            .onChange((isOn: boolean) => this.faceToFace = isOn)
          Text("面议")
            .fontSize(14)
            .padding({ left: 8 })
        }
          .padding({ top: 16, bottom: 8 })
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Image($r('app.media.hongbao'))
            .width(24)
            .height(24)
          TextInput({ placeholder: '请输入' })
            .backgroundColor('#F6F7FC')
            .border({ width: 2, color: '#E0E0E0', radius: 4 })
            .fontSize(14)
            .placeholderColor('#909090')
            .flexGrow(1)
            .onChange((v)=>{this.rewardAmount = v})
        }

        // 丢失时间部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("丢失时间")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        TextInput({ placeholder: '请选择' })
          .backgroundColor('#F6F7FC')
          .border({ width: 2, color: '#E0E0E0', radius: 4 })
          .fontSize(14)
          .placeholderColor('#909090')
          .onChange((v)=>{this.lostTime = v})

        // 丢失地点部分

        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("丢失地点（需开启手机、微信的定位功能）")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          TextInput({ placeholder: '请选择' })
            .backgroundColor('#F6F7FC')
            .border({ width: 2, color: '#E0E0E0', radius: 4 })
            .fontSize(14)
            .placeholderColor('#909090')
            .flexGrow(1)
            .onChange((v)=>{this.lostLocation = v})
          Image($r('app.media.location'))
            .width(24)
            .height(24)
        }

        // 丢失详情部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("丢失详情")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        TextInput({ placeholder: '请输入' })
          .backgroundColor('#F6F7FC')
          .border({ width: 2, color: '#E0E0E0', radius: 4 })
          .fontSize(14)
          .placeholderColor('#909090')
          .height(120)
          .width('100%')
          .padding({ bottom:70 })
          .onChange((v)=>{this.lostDetails = v})

        // 联系方式部分
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("联系方式")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}

        // 发布者信息
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text("发布者").width(80)
          TextInput({ placeholder: this.contactPublisher })
            .textAlign(TextAlign.End)
            .backgroundColor('#F6F7FC')
            .border({ width: 1, color: '#E0E0E0', radius: 4 })
            .fontSize(14)
            .placeholderColor('#909090')
            .flexGrow(1)
            .onChange((v)=>{this.contactPublisher = v})
        }
        // 联系电话
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text("联系电话").width(80)
          TextInput({ placeholder: '请输入' })
            .textAlign(TextAlign.End)
            .backgroundColor('#F6F7FC')
            .border({ width: 1, color: '#E0E0E0', radius: 4 })
            .fontSize(14)
            .placeholderColor('#909090')
            .flexGrow(1)
            .onChange((v)=>{this.contactPhone= v})
        }

        // 微信号
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text("微信号").width(80)
          TextInput({ placeholder: '请输入' })
            .textAlign(TextAlign.End)
            .backgroundColor('#F6F7FC')
            .border({ width: 1, color: '#E0E0E0', radius: 4 })
            .fontSize(14)
            .placeholderColor('#909090')
            .flexGrow(1)
            .onChange((v)=>{this.contactWechat = v})
        }

        // QQ号
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text("QQ号").width(80)
          TextInput({ placeholder: '请输入' })
            .textAlign(TextAlign.End)
            .backgroundColor('#F6F7FC')
            .border({ width:1, color: '#E0E0E0', radius: 4 })
            .fontSize(14)
            .placeholderColor('#909090')
            .flexGrow(1)
            .onChange((v)=>{this.contactQQ = v})
        }.padding({ bottom: 8 })

        // 展示手机号开关
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'showPhone' }).selectedColor('#FFCB45').shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange1(checked);
            })
          Text("可以通过手机号进行联系")
            .fontSize(15)
        }.padding({ bottom: 8 })

        // 微信二维码上传
        Row(){
          Text("")
            .width(4)
            .height(18)
            .backgroundColor("#FFCB45")
            .margin({ right: 8 })
        Text("微信二维码(选填)")
          .fontSize(16)
          .padding({ bottom: 8 })}
        Column() {
          Image($r('app.media.img'))
            .width(40)
            .height(40)
          Text("添加图片")
            .fontSize(12)
        }
        .backgroundColor('#F6F7FC')
        .padding(15)
        .alignItems(HorizontalAlign.Start)

        // 隐私协议
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'agreedProtocol' })
            .selectedColor('#FFCB45')
            .onChange((checked: boolean) => {
              this.agreedProtocol = checked
            })
          Text("请仔细阅读并勾选")
            .fontSize(14)
          Text("《用户隐私服务协议》")
            .fontSize(14)
            .fontColor('#FFCB45')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/my_project/publish/agreement' // 这里需要替换为实际的协议页面路由
              })
            })
        }.padding({ top: 16, bottom: 24 })

        // 发布按钮
        Button("发布")
          .width('100%')
          .height(50)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .backgroundColor("#FFCB45")
          .margin({ bottom: 24 })
          .onClick(() => {
            this.submitData();
            promptAction.showDialog({
              message: '您发布的信息已成功提交，义工会在2小时内审核。',
              buttons: [
                {
                  text: '确定',
                  color: '#000000',
                }
              ],
            })
            router.pushUrl({url:"pages/my_project/publish/group"})

          })

      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
    }
    .height('95%')
    .width('100%')
  }
}
