# 网络请求
需要在module.json5中配置
ohos.permission.INTERNET
1. import http from 
2. 创建一个httpRequest对象，request发起请求
3. 发起请求，request
![](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/picgo/202407302303164.png)
4. 返回是一个promise
5. 销毁http对象，destory

华为模拟器的wifi需要手动打开，要不然会报错：
Couldn't resolve host name

# 数据存储
https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101717498132814493

![](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/picgo/202407302303147.png)
key-value数据
导入模块 import ArkData
getPreferences获取preference实例
get查询
put插入
has查询是否存在
delete删除
flush写入文件（持久化保存)

# UIAbility

## AbilityStage

AbilityStage是一个[Module](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/application-package-structure-stage-V5)级别的组件容器，应用的HAP在首次加载时会创建一个AbilityStage实例，可以对该Module进行初始化等操作。

AbilityStage与Module一一对应，即一个Module拥有一个AbilityStage。

[AbilityStage](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5)拥有[onCreate()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageoncreate)生命周期回调和[onAcceptWant()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageonacceptwant)、[onConfigurationUpdated()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageonconfigurationupdate)、[onMemoryLevel()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageonmemorylevel)事件回调。

- [onCreate()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageoncreate)生命周期回调：在开始加载对应Module的第一个UIAbility实例之前会先创建AbilityStage，并在AbilityStage创建完成之后执行其onCreate()生命周期回调。AbilityStage模块提供在Module加载的时候，通知开发者，可以在此进行该Module的初始化（如资源预加载，线程创建等）能力。
- [onAcceptWant()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageonacceptwant)事件回调：UIAbility[指定实例模式（specified）](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/uiability-launch-type-V5#specified启动模式)启动时候触发的事件回调，具体使用请参见[UIAbility启动模式综述](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/uiability-launch-type-V5)。
- [onConfigurationUpdated()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageonconfigurationupdate)事件回调：当系统全局配置发生变更时触发的事件，系统语言、深浅色等，配置项目前均定义在[Configuration](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-configuration-V5)类中。
- [onMemoryLevel()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-abilitystage-V5#abilitystageonmemorylevel)事件回调：当系统调整内存时触发的事件。



## UIAbility

UIAbility的启动模式是指UIAbility实例在启动时的不同呈现状态。针对不同的业务场景，系统提供了三种启动模式：

- [singleton（单实例模式）](https://developer.huawei.com/consumer/cn/doc/#singleton启动模式)
- [multiton（多实例模式）](https://developer.huawei.com/consumer/cn/doc/#multiton启动模式)
- [specified（指定实例模式）](https://developer.huawei.com/consumer/cn/doc/#specified启动模式)

### singleton启动模式

singleton启动模式为单实例模式，也是默认情况下的启动模式。

每次调用[startAbility()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-inner-application-uiabilitycontext-V5#uiabilitycontextstartability)方法时，如果应用进程中该类型的UIAbility实例已经存在，则复用系统中的UIAbility实例。系统中只存在唯一一个该UIAbility实例，即在最近任务列表中只存在一个该类型的UIAbility实例。

![img](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/picgo/202407310001503.gif)

### multiton启动模式

multiton启动模式为多实例模式，每次调用[startAbility()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-inner-application-uiabilitycontext-V5#uiabilitycontextstartability)方法时，都会在应用进程中创建一个新的该类型UIAbility实例。即在最近任务列表中可以看到有多个该类型的UIAbility实例。这种情况下可以将UIAbility配置为multiton（多实例模式）。

![img](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/picgo/202407310002774.gif)

### specified启动模式

specified启动模式为指定实例模式，针对一些特殊场景使用（例如文档应用中每次新建文档希望都能新建一个文档实例，重复打开一个已保存的文档希望打开的都是同一个文档实例）。

![img](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/picgo/202407310002827.gif)



## **UIAbility组件间的交互**

UIAbility是系统调度的最小单元。在设备内的功能模块之间跳转时，会涉及到启动特定的UIAbility，该UIAbility可以是应用内的其他UIAbility，也可以是其他应用的UIAbility（例如启动三方支付UIAbility）。



### 启动应用内的UIAbility

当一个应用内包含多个UIAbility时，存在应用内启动UIAbility的场景。例如在支付应用中从入口UIAbility启动收付款UIAbility。

在EntryAbility中，通过调用[startAbility()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-inner-application-uiabilitycontext-V5#uiabilitycontextstartability)方法启动UIAbility，[want](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-want-V5)为UIAbility实例启动的入口参数

### 启动应用内的UIAbility并获取返回结果

在一个EntryAbility启动另外一个FuncAbility时，希望在被启动的FuncAbility完成相关业务后，能将结果返回给调用方。例如在应用中将入口功能和帐号登录功能分别设计为两个独立的UIAbility，在帐号登录UIAbility中完成登录操作后，需要将登录的结果返回给入口UIAbility。



### 启动其他应用的UIAbility

启动其他应用的UIAbility，通常用户只需要完成一个通用的操作（例如需要选择一个文档应用来查看某个文档的内容信息），推荐使用[隐式Want启动](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/want-overview-V5#want的类型)。系统会根据调用方的want参数来识别和启动匹配到的应用UIAbility。

启动UIAbility有[显式Want启动和隐式Want启动](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/want-overview-V5)两种方式。



### 启动其他应用的UIAbility并获取返回结果

当使用隐式Want启动其他应用的UIAbility并希望获取返回结果时，调用方需要使用[startAbilityForResult()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-inner-application-uiabilitycontext-V5#uiabilitycontextterminateselfwithresult)方法启动目标UIAbility。例如主应用中需要启动三方支付并获取支付结果。















