import { notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';

const TAG: string = '[PublishOperation]';
const DOMAIN_NUMBER: number = 0xFF00;


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Button("获取授权").onClick(()=>{
        let context = getContext(this) as common.UIAbilityContext;
        notificationManager.isNotificationEnabled().then((data: boolean) => {
          hilog.info(DOMAIN_NUMBER, TAG, "isNotificationEnabled success, data: " + JSON.stringify(data));
          if(!data){
            notificationManager.requestEnableNotification(context).then(() => {
              hilog.info(DOMAIN_NUMBER, TAG, `[ANS] requestEnableNotification success`);
            }).catch((err : BusinessError) => {
              if(1600004 == err.code){
                hilog.error(DOMAIN_NUMBER, TAG, `[ANS] requestEnableNotification refused, code is ${err.code}, message is ${err.message}`);
              } else {
                hilog.error(DOMAIN_NUMBER, TAG, `[ANS] requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
              }
            });
          }
        }).catch((err : BusinessError) => {
          hilog.error(DOMAIN_NUMBER, TAG, `isNotificationEnabled fail: ${JSON.stringify(err)}`);
        });
      })
      Button("发送通知").onClick(()=>{
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
            normal: {
              title: 'test_title',
              text: new Date().toString(),
              additionalText: 'test_additionalText',
            }
          }
        };
        notificationManager.publish(notificationRequest, (err: BusinessError) => {
          if (err) {
            hilog.error(DOMAIN_NUMBER, TAG, `Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
            return;
          }
          hilog.info(DOMAIN_NUMBER, TAG, 'Succeeded in publishing notification.');
        });
      })
    }
    .height('100%')
    .width('100%')
  }
}