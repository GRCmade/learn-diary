// Index.ets
import { BusinessError } from '@kit.BasicServicesKit';
import { calendarMgr } from '../entryability/EntryAbility';
import { calendarManager } from '@kit.CalendarKit';

let calendar: calendarManager.Calendar | undefined = undefined;
// 指定日历账户信息
const calendarAccount: calendarManager.CalendarAccount = {
  // 日历账户名称
  name: 'MyCalendar',
  // 日历账户类型
  type: calendarManager.CalendarType.LOCAL,
  // 日历账户显示名称，该字段如果不填，创建的日历账户在界面显示为空字符串。
  displayName: 'MyCalendar'
};


@Entry
@Component
struct Index {
  @State message: string = 'calendar';

  build() {
    Column({space:20}) {
      Button(this.message).onClick(()=>{
        // 创建日历账户
        calendarMgr?.createCalendar(calendarAccount).then((data: calendarManager.Calendar) => {
          console.log(`Succeeded in creating calendar data->${JSON.stringify(data)}`);
          calendar = data;

          const config: calendarManager.CalendarConfig = {
            // 打开日程提醒
            enableReminder: true,
            // 设置日历账户颜色
            color: '#aabbcc'
          };
          // 设置日历配置信息
          calendar.setConfig(config).then(() => {
            console.info(`Succeeded in setting config, data->${JSON.stringify(config)}`);
          }).catch((err: BusinessError) => {
            console.error(`Failed to set config. Code: ${err.code}, message: ${err.message}`);
          });
        }).catch((error: BusinessError) => {
          console.error(`Failed to create calendar. Code: ${error.code}, message: ${error.message}`);
        });
      }).width('100%')

      Button("查询账户日历").onClick(()=>{
        // Index.ets
        calendarMgr?.getAllCalendars().then((data: calendarManager.Calendar[]) => {
          console.info(`Succeeded in getting all calendars, data -> ${JSON.stringify(data)}`);
          data.forEach((calendar) => {
            const account = calendar.getAccount();
            console.info(`account -> ${JSON.stringify(account)}`);
          })
        }).catch((err: BusinessError) => {
          console.error(`Failed to get all calendars. Code: ${err.code}, message: ${err.message}`);
        });
      }).width('100%')
    }
    .margin({top:20})
    // .height('100%')
    // .width('100%')
  }
}