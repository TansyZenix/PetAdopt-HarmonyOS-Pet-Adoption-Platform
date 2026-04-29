import router from '@ohos.router';
import {post}from './../../../services/request'
import {promptAction} from '@kit.ArkUI'
@Entry
@Component
export  struct PetAdoptionPage {
  @State message: string = 'Hello World';
  @State petTitle: string = '';
  @State petSource: string = '';
  @State petType: string = '';
  @State petName: string = '';
  @State petGener: string = '';
  @State petAge: string = '';
  @State adoptionMethod: string = '';
  @State vaccineStatus: string = '';
  @State sterilizationStatus: string = '';
  @State dewormingStatus: string = '';
  @State bodyType: string = '';
  @State hairType: string = '';
  @State selectedTraits: string[] = [];
  @State adoptionRequirements: string[] = [];
  @State adoptionLocation: string = '';
  @State storyContent: string = '';
  @State contactPerson: string = '';
  @State contactPhone: string = '';
  @State contactWechat: string = '';
  @State contactQQ: string = '';
  @State showPhone: boolean = false;
  @State agreedProtocol: boolean = false;

  handleCheckboxChange(value: string, array: string[]) {
    const index = array.indexOf(value);
    if (index > -1) {
      array.splice(index, 1);
    } else {
      array.push(value);
    }
  }
  handleCheckboxChange1(value: boolean) {
    this.showPhone = value;
  }

  async submitData() {
    let params = JSON.stringify({
      petTitle: this.petTitle,
      petSource: this.petSource,
      petType: this.petType,
      petName: this.petName,
      petGener: this.petGener,
      petAge: this.petAge,
      adoptionMethod: this.adoptionMethod,
      vaccineStatus: this.vaccineStatus,
      sterilizationStatus: this.sterilizationStatus,
      dewormingStatus: this.dewormingStatus,
      bodyType: this.bodyType,
      hairType: this.hairType,
      selectedTraits: this.selectedTraits,
      adoptionRequirements: this.adoptionRequirements,
      adoptionLocation: this.adoptionLocation,
      storyContent: this.storyContent,
      contactPerson: this.contactPerson,
      contactPhone: this.contactPhone,
      contactWechat: this.contactWechat,
      contactQQ: this.contactQQ,
      showPhone: this.showPhone,
    });

    let result = await post('http://localhost:3000/petRoutes/petsongyang', params);
    let code: number = JSON.parse(result).code;
    if (code == 201) {
      promptAction.showToast({
        message: '上传成功',
        duration: 2000,
      });
      // router.pushUrl({ url: 'pages/group2' });
    } else {
      promptAction.showToast({
        message: '上传失败',
        duration: 2000,
      });
    }


  }
  build() {

    Scroll(){
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
        Text("发布领养信息")
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
      .backgroundColor( '#F6F7FC')
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
      }.backgroundColor( '#F6F7FC')
      .padding(15)
      .alignItems(HorizontalAlign.Start)
        // 领养标题部分
      Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
        Text("领养标题")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
        TextInput({ placeholder: '请输入' })
          .backgroundColor('#F6F7FC')
          .border({ width: 2, color: '#E0E0E0', radius: 4 })
          .fontFamily('Nuntio sans')
          .fontSize(14)
          .lineHeight(20)
          .letterSpacing(0)
          .placeholderColor('#909090')
          .onChange((v:string)=>{this.petTitle = v})


        // 宠物来源部分
      Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
        Text('宠物来源')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Button("流浪救助")
          .width(180)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.petSource === '流浪救助' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.petSource = '流浪救助')
        Button("家养宠物")
          .width(180)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.petSource === '家养宠物' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.petSource = '家养宠物')
      }
        // 宠物来源选择


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
          .backgroundColor(this.petType === '猫猫' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.petType = '猫猫')
        Button("狗狗")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.petType === '狗狗' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.petType= '狗狗')
        Button("其他")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.petType === '其他' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.petType = '其他')
      }.padding({ top: 8 })

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

        // 新的表单部分开始
        // 宠物性别
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

        // 宠物年龄
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
          .fontFamily('Nuntio sans')
          .fontSize(14)
          .lineHeight(20)
          .letterSpacing(0)
          .placeholderColor('#909090')
          .onChange((v)=>{this.petAge = v})

        // 领养方式
      Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
        Text("领养方式")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Button("无偿")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.adoptionMethod === '无偿' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.adoptionMethod = '无偿')
        Button("红包")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.adoptionMethod === '红包' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.adoptionMethod = '红包')
        Button("押金")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.adoptionMethod === '押金' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.adoptionMethod = '押金')
      }

        // 宠物现状
      Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
        Text("宠物现状")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })}
      Text("疫苗")
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .padding({ top: 16, bottom: 8 })
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Button("已接种")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.vaccineStatus === '已接种' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.vaccineStatus = '已接种')
        Button("接种中")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.vaccineStatus === '接种中' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.vaccineStatus = '接种中')
        Button("未接种")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.vaccineStatus === '未接种' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.vaccineStatus = '未接种')
        Button("不详")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.vaccineStatus === '不详' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.vaccineStatus = '不详')
      }

        // 绝育

        Text("绝育")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Button("已绝育")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.sterilizationStatus === '已绝育' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.sterilizationStatus = '已绝育')
        Button("未绝育")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.sterilizationStatus === '未绝育' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.sterilizationStatus = '未绝育')
        Button("不详")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.sterilizationStatus === '不详' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.sterilizationStatus = '不详')
      }

        // 驱虫

        Text("驱虫")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Button("已驱虫")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.dewormingStatus === '已驱虫' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.dewormingStatus = '已驱虫')
        Button("未驱虫")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.dewormingStatus === '未驱虫' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.dewormingStatus = '未驱虫')
        Button("不详")
          .width(120)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.dewormingStatus === '不详' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.dewormingStatus = '不详')
      }

        // 体型

        Text("体型")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 16, bottom: 8 })
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Button("迷你")
            .width(100)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.bodyType === '迷你' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.bodyType = '迷你')
          //
          Button("小型")
            .width(100)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.bodyType === '小型' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.bodyType = '小型')
          //
          Button("中型")
            .width(100)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.bodyType === '中型' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.bodyType = '中型')
          //
          Button("大型")
            .width(100)
            .height(40)
            .fontColor(Color.Black)
            .backgroundColor(this.bodyType === '大型' ? "#FFCB45" : "#F2F2F2")
            .onClick(() => this.bodyType = '大型')
        }


      Text("毛发")
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .padding({ top: 16, bottom: 8 })
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Button("长毛")
          .width(100)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.hairType === '长毛' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.hairType = '长毛')
        //
        Button("短毛")
          .width(100)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.hairType === '短毛' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.hairType = '短毛')
        //
        Button("卷毛")
          .width(100)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.hairType === '卷毛' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.hairType = '卷毛')
        //
        Button("无毛")
          .width(100)
          .height(40)
          .fontColor(Color.Black)
          .backgroundColor(this.hairType === '无毛' ? "#FFCB45" : "#F2F2F2")
          .onClick(() => this.hairType = '无毛')
      }
      // 宠物特点
      Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
      Text("宠物特点")
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .padding({ top: 16, bottom: 8 })}
      Flex({ direction: FlexDirection.Column }) {
        Row() {
          Checkbox({ name: '温顺' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('温顺', this.selectedTraits);
            })
          Text('温顺').fontSize(20)
            .margin({ right: 100 })
          Checkbox({ name: '调皮' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('调皮', this.selectedTraits);
            })
          Text('调皮').fontSize(20)
        }

        Row() {
          Checkbox({ name: '运动量大' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('运动量大', this.selectedTraits);
            })
          Text('运动量大').fontSize(20)
            .margin({ right: 60 })
          Checkbox({ name: '不挑食' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('不挑食', this.selectedTraits);
            })
          Text('不挑食').fontSize(20)
        }

        Row() {
          Checkbox({ name: '聪明' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('聪明', this.selectedTraits);
            })
          Text('聪明').fontSize(20)
            .margin({ right: 100 })
          Checkbox({ name: '无攻击性' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('无攻击性', this.selectedTraits);
            })
          Text('无攻击性').fontSize(20)
        }

        Row() {
          Checkbox({ name: '会看家' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('会看家', this.selectedTraits);
            })
          Text('会看家').fontSize(20)
            .margin({ right: 80 })
          Checkbox({ name: '不乱叫' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('不乱叫', this.selectedTraits);
            })
          Text('不乱叫').fontSize(20)
        }
      }

      // 领养要求
      Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
      Text("领养要求（可选）")
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .padding({ top: 16, bottom: 8 })}
      Flex({ direction: FlexDirection.Column }) {
        Row() {
          Checkbox({ name: '仅限同城领养，不可邮寄' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('仅限同城领养，不可邮寄', this.adoptionRequirements);
            })
          Text('仅限同城领养，不可邮寄').fontSize(20)
        }
        Row() {
          Checkbox({ name: '签订领养协议，互换身份证复印件' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('签订领养协议，互换身份证复印件', this.adoptionRequirements);
            })
          Text('签订领养协议，互换身份证复印件').fontSize(20)
        }
        Row() {
          Checkbox({ name: '不接受学生领养' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('不接受学生领养', this.adoptionRequirements);
            })
          Text('不接受学生领养').fontSize(20)
        }
        Row() {
          Checkbox({ name: '年龄需20岁以上' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('年龄需20岁以上', this.adoptionRequirements);
            })
          Text('年龄需20岁以上').fontSize(20)
        }
        Row() {
          Checkbox({ name: '须有稳定工作和收入' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('须有稳定工作和收入', this.adoptionRequirements);
            })
          Text('须有稳定工作和收入').fontSize(20)
        }
        Row() {
          Checkbox({ name: '养猫封窗，养犬牵引' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('养猫封窗，养犬牵引', this.adoptionRequirements);
            })
          Text('养猫封窗，养犬牵引').fontSize(20)
        }
        Row() {
          Checkbox({ name: '自有住房' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('自有住房', this.adoptionRequirements);
            })
          Text('自有住房').fontSize(20)
        }
        Row() {
          Checkbox({ name: '接受视频回访' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('接受视频回访', this.adoptionRequirements);
            })
          Text('接受视频回访').fontSize(20)
        }
        Row() {
          Checkbox({ name: '接受上门家访' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('接受上门家访', this.adoptionRequirements);
            })
          Text('接受上门家访').fontSize(20)
        }
        Row() {
          Checkbox({ name: '不接受合租领养' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('不接受合租领养', this.adoptionRequirements);
            })
          Text('不接受合租领养').fontSize(20)
        }
        Row() {
          Checkbox({ name: '其他要求' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange('其他要求', this.adoptionRequirements);
            })
          Text('其他要求').fontSize(20)
        }
      }
          Row(){
            Text("")
              .width(4)
              .height(18)
              .backgroundColor("#FFCB45")
              .margin({ right: 8 })
            Text("领养地点（需开启手机、微信的定位功能）")
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
              .onChange((v)=>{this.adoptionLocation = v})

            Image($r('app.media.location'))
              .width(24)
              .height(24)
          }

      Row(){
        Text("")
          .width(4)
          .height(18)
          .backgroundColor("#FFCB45")
          .margin({ right: 8 })
          Text("Ta的故事")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .padding({ top: 16, bottom: 8 })}
          TextInput({ placeholder: '请说明宠物经历、健康状况、送养原因等...' })
            .backgroundColor('#F6F7FC')
            .border({ width: 2, color: '#E0E0E0', radius: 4 })
            .height(120)
            .width('100%')
            .onChange((v)=>{this.storyContent = v})

          // 联系方式
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
            TextInput({ placeholder: '小可爱791840' })
              .flexGrow(1)
              .onChange((v)=>{this.contactPerson = v})

          }.padding({ bottom: 8 })

          // 联系电话
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
            Text("联系电话").width(80)
            TextInput({ placeholder: '请输入' })
              .flexGrow(1)
              .onChange((v)=>{this.contactPhone = v})
          }.padding({ bottom: 8 })

          // 微信号
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
            Text("微信号").width(80)
            TextInput({ placeholder: '请输入' })
              .flexGrow(1)
              .onChange((v)=>{this.contactWechat = v})
          }.padding({ bottom: 8 })

          // QQ号
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
            Text("QQ号").width(80)
            TextInput({ placeholder: '请输入' })
              .flexGrow(1)
              .onChange((v)=>{this.contactQQ = v})
          }.padding({ bottom: 8 })

      // 展示手机号开关
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Row() {
          Checkbox({ name: '展示手机号' })
            .selectedColor('#FFCB45')
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onChange((checked: boolean) => {
              this.handleCheckboxChange1(checked);
            })
          Text('展示手机号').fontSize(15)
        }
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
      .backgroundColor( '#F6F7FC')
      .padding(15)
      .alignItems(HorizontalAlign.Start)


      // 隐私协议
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Checkbox({ name: 'agreedProtocol' })
          .onChange((checked: boolean) => {
            this.agreedProtocol = checked
          })
        Text("已阅读并同意")
          .fontSize(14)
        Text("《用户隐私服务协议》")
          .fontSize(14)
          .fontColor('#FFCB45')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/agreement' // 这里需要替换为实际的协议页面路由
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
              }], })
          router.pushUrl({url:"pages/my_project/publish/group2"})
        })

    }.alignItems(HorizontalAlign.Start)

    .width('100%')
    }.height('95%')
    .width('100%')
  }
}