import router from '@ohos.router'
// 定义主题接口
interface ThemeConfig {
  primary: string;
  secondary: string;
  text: string;
  button: string;
}

@Entry
@Component
struct ContactVolunteerPage {
  @State name: string = '';
  @State phone: string = '';
  @State adoptionTime: string = '选择时间';
  @State description: string = '';
  @State showPlaceholder: boolean = true;

  // 主题颜色配置
  private theme: ThemeConfig = {
    primary: '#FFD700',
    secondary: '#FFFFFF',
    text: '#333333',
    button: '#8B8000'
  };

  build() {
    Column() {
      // 头部标题
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())
        Text('联系领养义工')
          .fontSize(24)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)

      this.buildUserForm();
      this.buildTimePicker();
      this.buildDescriptionInput();
      this.buildSubmitButton();
      this.buildEmergencyContact();

    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.theme.secondary);
  }

  @Builder
  buildUserForm() {
    Column() {
      Text('请输入姓名')
      TextInput({ text: this.name })
        .height(40)
        .border({width:1})
        .backgroundColor(this.theme.secondary)
        .margin({ top: 10, bottom: 10 })
        .padding(8)
        .borderRadius(20)
        .onChange((value: string) => {
          this.name = value;
        });

      Text('请输入联系电话')
      TextInput({ text: this.phone })
        .height(40)
        .border({width:1})
        .backgroundColor(this.theme.secondary)
        .margin({ top: 10,bottom: 10 })
        .padding(8)
        .borderRadius(20)
        .onChange((value: string) => {
          this.phone = value;
        });
    }
    .padding(15)
    .margin(10)
    .backgroundColor(this.theme.secondary)
    .borderRadius(8)
    .shadow({ radius: 4, color: '#00000010' });
  }

  @Builder
  buildTimePicker() {
    Button(this.adoptionTime)
      .width('90%')
      .height(40)
      .backgroundColor(this.theme.primary)
      .fontColor(this.theme.text)
      .margin(10)
      .onClick(() => {
        this.adoptionTime = '2025-3-21';
      });
  }

  @Builder
  buildDescriptionInput() {
    Column() {
      if (this.description === '' && this.showPlaceholder) {
        Text('请描述您的需求（如想领养的宠物类型、特殊要求等）')
          .fontColor('#999')
          .margin({ left: 5 })
          .width('100%')
      }
      TextArea({ text: this.description })
        .height(120)
        .width('90%')
        .backgroundColor(this.theme.secondary)
        .padding(10)
        .margin(10)
        .borderRadius(8)
        .onChange((value: string) => {
          this.description = value;
          this.showPlaceholder = value === '';
        });
    }
    .width('100%')
  }

  @Builder
  buildSubmitButton() {
    Button('提交申请')
      .width('90%')
      .height(45)
      .backgroundColor(this.theme.button)
      .fontColor('#FFFFFF')
      .fontSize(16)
      .margin(20)
      .onClick(() => {
        console.log('申请信息：', this.name, this.phone, this.description);
      });
  }

  @Builder
  buildEmergencyContact() {
    Column() {
      Text('紧急联系方式')
        .fontSize(16)
        .fontColor(this.theme.text)
        .margin({ bottom: 10 });

      Text('24小时义工热线：400-123-4567')
        .fontSize(14)
        .fontColor('#666666');

      Text('微信客服：rescue_volunteer')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ top: 5 });
    }
    .padding(15)
    .margin(10)
    .backgroundColor(this.theme.secondary)
    .borderRadius(8)
    .width('90%');
  }
}