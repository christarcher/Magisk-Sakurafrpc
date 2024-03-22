#!/data/adb/magisk/busybox sh
#MODDIR=${0%/*}
MODDIR="$(dirname $(readlink -f "$0"))"

# 读取存储在magisk目录下的frpc.conf中的token
chmod 400 ${MODDIR}/token.conf
TOKEN=$(cat ${MODDIR}/token.conf)

# 运行frpc程序
chmod +x ${MODDIR}/frpc
nohup ${MODDIR}/frpc -f $TOKEN >/dev/null 2>&1 &

if [ -s "${MODDIR}/token.conf" ]; then
    # token.conf不为空，进入循环监控frpc进程
    while true; do
        if ! pgrep -f "${MODDIR}/frpc" > /dev/null; then
            # 如果frpc进程不存在，则重启frpc
            nohup ${MODDIR}/frpc -c "${MODDIR}/token.conf" >/dev/null 2>&1 &
        fi
        # 每隔一段时间检查一次，这里设置为每120秒检查一次，以减少性能消耗
        sleep 120
    done
else
    # token.conf为空，不执行frpc进程的监控和重启逻辑
    exit 1
fi