# ios中各种唯一标识符

出于保护用户隐私的考虑， Apple 不会允许开发者来定位用户的设备，只允许开发者来对 App 进行定位。
## IDFA（广告标识符）
多用于用户的广告追踪，是每台设备的唯一 ID
可通过 隐私->广告->限制广告跟踪 这个开关改变标识符 开关打开会变成00000000-0000-0000-0000-000000000000
隐私->广告->还原广告标识符 会改变标识符的值
删除应用重新安装 标识符不会改变 
不同应用对应的idfa是相同的值

```
NSString *idfa = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
BOOL istracking = [ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled;
```
## IDFV 
Vendor 标示符，也被称为厂商标识符。只要用户的设备中没有卸载当前 Vendor 的所有 APP，则不会发生变化，都卸载后再重新安装会发生变化。什么是 Vendor ？可以理解成 bundleID 的前两部分，例如对于 com.msb.app_1 和 com.msb.app_2 这两个 bundleID 来说，就属于同一个 Vendor ，共享同一个 IDFV。

```
NSString *idfv = [UIDevice currentDevice].identifierForVendor.UUIDString;
```

## NSUUID（通用唯一识别码）
NSUUID 与之前的 CFUUID 是一致的，只是改成了 Objective-C 的接口而已，NSUUID 每次获取的值都会发生变化，但是它会保持唯一性。

```
NSString *udid = [NSUUID UUID].UUIDString;
```
## IMEI（iOS5 deprecated）
国际移动设备身份码，在手机组装完成后赋予的一个全球唯一的号码，由于此时 iPhone 只支持单卡，所以 IMEI 和 iPhone 是一一对应的。
## UDID（iOS6 deprecated）
苹果 iOS 设备的唯一识别码
## Mac 地址（iOS7 deprecated）
Mac（Medium/Media Access Control）：网络设备的物理地址，如果 IMEI 被认为是设备的唯一标识，那么 Mac 就是网络接口唯一标识。学过计算机网络都知道，在根据 IP 进行物理寻址的时候就是使用的 Mac 地址。

同样由于隐私问题，在 iOS 7 之后无法通过 Mac 地址来标识唯一设备，因为在 iOS 7 之后获取到的 Mac 地址为一固定值。



