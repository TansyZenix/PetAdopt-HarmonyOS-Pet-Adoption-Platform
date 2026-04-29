import router from '@ohos.router'
import { promptAction } from '@kit.ArkUI';

interface GeneratedObjectLiteralInterface_1 {
  primary: string;
  secondary: string;
  text: string;
  button: string;
  disabled: string;
}

@Entry
@Component
struct AdoptionProtocolPage {
  @State name: string = ''; // 领养人姓名
  @State gender: string = '女'; // 领养人性别
  @State phone: string = ''; // 领养人联系方式
  @State isAgreed: boolean = false; // 是否同意协议
  @State isSubmitted: boolean = false; // 是否已提交

  // 主题颜色配置
  private theme: GeneratedObjectLiteralInterface_1 = {
    primary: '#FFD700', // 主背景色
    secondary: '#FFFFFF', // 卡片背景色
    text: '#333333', // 文字颜色
    button: '#FFFFE0', // 按钮颜色
    disabled: '#CCCCCC' // 禁用状态颜色
  };

  build() {
    Column() {
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())
        Text('救助圈——爱心领养协议')
          .fontSize(24)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)

      this.buildAdopterForm();
      this.buildAgreementTerms();
      this.buildAgreementCheck();
      this.buildConfirmButton();

      // 提交成功提示
      if (this.isSubmitted) {
        Stack({ alignContent: Alignment.TopStart}) {
          Column({space:50}) {
            Text('                   提交成功！\n工作人员将在3个工作日内联系您')
              .fontWeight(FontWeight.Medium)
              .fontSize(16)
              .fontColor('#8B1A1A')
              .margin(20)
          }
          .width('90%')
          .height('20%')
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
        }
      }
    }


    .width('100%')
    .height('100%')
    .backgroundColor(this.theme.primary) // 设置主背景色
    .padding(10);
  }

  // 构建领养人信息表单
  @Builder
  buildAdopterForm() {
    Column() {
      Text('领养人信息').fontSize(18).margin(10);

      // 姓名输入
      Row() {
        Text('姓名：').width('30%');
        TextInput({ text: this.name })
          .width('70%')
          .backgroundColor(this.theme.secondary)
          .onChange((value: string) => {
            this.name = value;
          });
      }
      .margin({ top: 5, bottom: 5 });

      // 性别选择
      Row() {
        Text('性别：').width('30%');
        Select([
          { value: '男' },
          { value: '女' }
        ])
          .value(this.gender)
          .onSelect((index: number) => {
            this.gender = index === 0 ? '男' : '女';
          })
          .width('70%');
      }
      .margin({ top: 5, bottom: 5 });

      // 联系方式输入
      Row() {
        Text('联系方式：').width('30%');
        TextInput({ text: this.phone })
          .width('70%')
          .backgroundColor(this.theme.secondary)
          .onChange((value: string) => {
            this.phone = value;
          });
      }
      .margin({ top: 5, bottom: 5 });
    }
    .padding(10)
    .backgroundColor(this.theme.secondary)
    .borderRadius(8)
    .margin(10);
  }

  // 构建领养协议条款
  @Builder
  buildAgreementTerms() {
    Column() {
      Text('领养须知条款').fontSize(18).margin(10);

      Scroll() {
        Column() {
          Text('1. 领养人需年满18周岁，具有完全民事行为能力');
          Text('2. 必须为宠物提供适宜的生活环境');
          Text('3. 定期进行疫苗接种和健康检查');
          Text('4. 不得虐待、遗弃或转卖宠物');
          Text('5. 接受定期回访（每月至少一次）');
          Text('6. 如遇特殊情况无法继续饲养，需送回救助站');
          Text('7. 领养需提供有效身份证件复印件');
          Text('8. 领养后前三个月为试用期');
        }
        .padding(10)
        .alignItems(HorizontalAlign.Start)
      }
      .height(150);
    }
    .padding(10)
    .backgroundColor(this.theme.secondary)
    .borderRadius(8)
    .margin(10);
  }

  // 构建协议确认复选框
  @Builder
  buildAgreementCheck() {
    Row() {
      Toggle({ type: ToggleType.Checkbox })
        //.isOn(this.isAgreed)
        .onChange((value: boolean) => {
          this.isAgreed = value;
        })
        .size({ width: 20, height: 20 });

      Text('我已阅读并同意以上领养协议条款')
        .fontSize(14)
        .margin({ left: 10 });
    }
    .margin(15)
    .alignItems(VerticalAlign.Center);
  }

  // 构建确认领养按钮
  @Builder
  buildConfirmButton() {
    Button('确认领养')
      .width('80%')
      .height(40)
      .backgroundColor(this.isAgreed ? this.theme.button : this.theme.disabled)
      .fontColor('#8B864E')
      .margin(20)
      .enabled(this.isAgreed)
      .onClick(() => {
        this.isSubmitted = true;
      });
  }
}