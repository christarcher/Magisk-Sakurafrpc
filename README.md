# Magisk-SakuraFrpc

基于Magisk的内网穿透模块,内含SakuraFrp程序,填入sakurafrp的token和隧道id后可以暴露开放在手机上的服务,例如adb和http等,如果你的设备使用了Web服务或其他服务需要远程访问,那么该模块将是您的不错的选择。

## 描述

用Magisk来启动sakurafrpc,有以下三大特性:

1.对比App权限更高,不容易被杀死,杀死后再次拉起,保证服务的在线率

2.可以在开机进入系统前(也就是加载/sdcard/前)启动,避免重启后需要手动拉起

3.在后台无感知运行

## 使用方法

### 先决条件

- Magisk v20.4 +
- 连接互联网
- 仅支持Arm AArch64 / ARM64,如果是老处理器可以手动下载并替换掉压缩文件中的frpc

### 安装步骤

1. **下载模块文件**

2. **获取token和隧道id**:在natfrp.com官网上隧道列表中获取token和隧道id,形式如下: 01234567890ctgljp24oq11234567890:12345678

3. **修改`token.conf`**（可选）：如果你在安装模块之前已经知道了你的token和隧道ID，可以先解压模块文件并修改`token.conf`，填入相应的信息。

4. **安装模块**：通过Magisk Manager安装模块文件。

5. **配置Token和隧道ID**：如果你没有在第3步中提前修改`token.conf`，请在安装模块后通过文件管理器或终端编辑`/data/adb/sakurafrp/token.conf`，将你的token和隧道ID填入该文件。

6. **重启设备**：完成配置后，重启你的设备以启动SakuraFrpc服务。

