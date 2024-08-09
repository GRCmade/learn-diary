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



# 应用程序包结构

## Stage包结构

### 开发态包结构

![image-20240801205921937](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/image-20240801205921937.png)

| 文件类型      | 说明                                                         |
| ------------- | ------------------------------------------------------------ |
| 配置文件      | 包括应用级配置信息、以及Module级配置信息：- **AppScope > app.json5**：[app.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/app-configuration-file-V5)，用于声明应用的全局配置信息，比如应用Bundle名称、应用名称、应用图标、应用版本号等。- **Module_name > src > main > module.json5**：[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/module-configuration-file-V5)，用于声明Module基本信息、支持的设备类型、所含的组件信息、运行所需申请的权限等。 |
| ArkTS源码文件 | **Module_name > src > main > ets**：用于存放Module的ArkTS源码文件（.ets文件）。 |
| 资源文件      | 包括应用级资源文件、以及Module级资源文件，支持图形、多媒体、字符串、布局文件等，详见[资源分类与访问](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/resource-categories-and-access-V5)。- **AppScope > resources** ：用于存放应用需要用到的资源文件。- **Module_name > src > main > resources** ：用于存放该Module需要用到的资源文件。 |
| 其他配置文件  | 用于编译构建，包括构建配置文件、编译构建任务脚本、混淆规则文件、依赖的共享包信息等。- **build-profile.json5**：工程级或Module级的构建配置文件，包括应用签名、产品配置等。- **hvigorfile.ts**：应用级或Module级的编译构建任务脚本，开发者可以自定义编译构建工具版本、控制构建行为的配置参数。- **obfuscation-rules.txt**：混淆规则文件。混淆开启后，在使用Release模式进行编译时，会对代码进行编译、混淆及压缩处理，保护代码资产。- **oh-package.json5**：用于存放依赖库的信息，包括所依赖的三方库和共享包。 |



### 编译态的包结构

![QQ_1722517393458](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/QQ_1722517393458.png)

- **ets目录**：ArkTS源码编译生成.abc文件。
- **resources目录**：AppScope目录下的资源文件会合入到Module下 面资源目录中，如果两个目录下存在重名文件，编译打包后只会保留AppScope目录下的资源文件。
- **module配置文件**：AppScope目录下的app.json5文件字段会合入到Module下面的module.json5文件之中，编译后生成HAP或HSP最终的module.json文件。



### 发布态的包结构

每个应用中至少包含一个.hap文件，可能包含若干个.hsp文件、也可能不含，一个应用中的所有.hap与.hsp文件合在一起称为**Bundle**，其对应的bundleName是应用的唯一标识

当应用发布上架到应用市场时，需要将Bundle打包为一个.app后缀的文件用于上架，这个.app文件称为**App Pack**（Application Package），与此同时，DevEco Studio工具自动会生成一个**pack.info**文件。**pack.info**文件描述了App Pack中每个HAP和HSP的属性，包含APP中的bundleName和versionCode信息、以及Module中的name、type和abilities等信息。

![QQ_1722517658283](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/QQ_1722517658283.png)



| Module类型     | 包类型                                                       | 说明                                                         |
| -------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Ability        | [HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/hap-package-V5) | 应用的功能模块，可以独立安装和运行，必须包含一个entry类型的HAP，可选包含一个或多个feature类型的HAP。 |
| Static Library | [HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/har-package-V5) | 静态共享包，编译态复用。- 支持应用内共享，也可以发布后供其他应用使用。- 作为二方库，发布到[OHPM](https://ohpm.openharmony.cn/)私仓，供公司内部其他应用使用。- 作为三方库，发布到[OHPM](https://ohpm.openharmony.cn/)中心仓，供其他应用使用。- 多包（HAP/HSP）引用相同的HAR时，会造成多包间代码和资源的重复拷贝，从而导致应用包膨大。- 注意：[编译HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/har-package-V5#编译)时，建议开启混淆能力，保护代码资产。 |
| Shared Library | [HSP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/in-app-hsp-V5) | 动态共享包，运行时复用。- 当前仅支持应用内共享。- 当多包（HAP/HSP）同时引用同一个共享包时，采用HSP替代HAR，可以避免HAR造成的多包间代码和资源的重复拷贝，从而减小应用包大小。 |



# 布局优化

lazyForEach可以优化组件的性能，有利于大量列表项的渲染

forEach提供了一个keyGenerator参数 ，这个参数可以通过它来自定义键值的生成规则





# ArkTS

声明式UI与html开发区别

![image-20240803152057953](https://yuhepicgo.oss-cn-beijing.aliyuncs.com/image-20240803152057953.png)

## typescrpit

![image-20240803152356296](/Users/gaoruicheng/Library/Application Support/typora-user-images/image-20240803152356296.png)

变量的声明：

