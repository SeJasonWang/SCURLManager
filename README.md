# SCURLManager
一个url的管理器
通过openURL的形式自定义对应的行为
例如：

打开一个webView
``` bash
[SCURLManager openURL:[NSURL URLWithString:@"http://www.baidu.com"]]
```

通过定义对应的type执行对应操作
``` bash
[SCURLManager openURL:[NSURL URLWithString:@"<scheme>://<type>?<encode后的json>"]]
```
demo内的scheme为@"xxxx"
type为@"test"，对应操作为present一个AlertView
如果带上encode后的json，最后可以解析出来赋值给params属性

![demo](https://img.alicdn.com/imgextra/i2/135480037/TB20oCUkXXXXXXmXXXXXXXXXXXX_!!135480037.gif)
