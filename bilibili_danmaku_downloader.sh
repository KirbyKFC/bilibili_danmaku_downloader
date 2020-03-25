#!/bin/bash

#下载目录
danmaku_path="/mnt/d/Download/"
#屏幕尺寸
screen_size="3840x2160"
#字体
font="Sarasa Mono SC Bold"
#字体大小
font_size=40
#透明度
alpha=0.8
#滚动弹幕停留时间
duration_marquee=12
#静止弹幕停留时间
duration_still=6

#弹幕屏蔽规则
danmaku_filter='人活着就是|666|弹幕|我的天|搞事情|厉害了|周指活|完结撒花|广卞廿十一卉半与本二上旦上二本与半卉一十廿卞广|空耳|炮姐|退群|牧濑|bilibili|哔哩|大老师|兮|秦|唐|吴|蜀|魏|晋|烛之武|隆中对|逍遥|先帝|豫|东山|三峡|吹牛|武陵|路哥|撒花|长高|脱单|爱死|破站|B站|字幕组|会计|剧透|明非|入团|\d+\.\d+\.\d+|^(第|前)(一|二|三|四|五|六|七|八|九|十|百|千|万|[0-9])+(？|\?|!|！)|^\s+$|引战|闭嘴|打脸|素质|[键鍵][盘盤](侠|大手|斗士|[黨党])|喷子|吵架|[撕逼][逼Bb]|当你.*不是[第前]|^\s{0,}((19|2[0-9])[1-9]{2}|[1-9]{2})|^[^好顶赞棒牛]$|[啊Aa]{8,}|[哈Hh]{8,}|[呜5u]{7,}|[嗷奥噢]{7,}|引战|闭嘴|打脸|素质|[键鍵][盘盤](侠|大手|斗士|[黨党])|喷子|吵架|脑残|下限|智商|人渣|有病|(去|弄|必须)死|杀了[你我他她它泥尼拟]|[弹彈][幕目](测试|[留劉]念)|合影|[由有]我(来){0,}[组租]成|^.{2,6}[我咱].{0,2}的|拔[刀剑]|.{1,}嫁.我|我[的哒]|喜欢你.{0,5}$|爱着你|你们.{0,3}分|[在和].{0,2}(床上|上床)|[偷抱]走|[挑找抢]老婆|我.{0,2}|签到|打卡|留..念|到此一游|观光团|每[天日]\S{1,}|\S{1,}周目|关.*[弹彈]幕|[当档挡].*([屏字]幕|字母)|[低底][端部][弹彈]幕|倍.{0,3}速|沙发|板凳|前排|(好|这么|如此)[前钱钳早]|[路飘飞游撸]过|sf|Sf|(毛|什么)啊|[火][前钳]|[流留刘][名铭明]|要火|万火留|剧透|剧透|透剧|透剧|人干的|人干事|[求|我|祝|保佑].*[考|上]|保佑.*[我|前|不|挂]|考神|我知道你.{0,1}[在再能]看|[我只唯][宣爱]|汉[奸J]|纳粹|法西斯|壮哉.*大|再战.*年|永垂不朽|长存|骑士团|参见|^.王$|(世界|圆盘|时[臣辰晨])的错|(EX|Ex|ex)咖喱棒|物理学圣剑|撬棍|贤者之石|死海文书|保证(不打死|打不死)|ntr|NTR|Ntr|NTL|ntl|Ntl|NTRS|ntrs|Ntrs|牛头|TF|tf|Tf|[掏淘吃拔捅舔吃食][粪屎翔]|CF|cf|Cf|cF|穿越火线|腾讯|[3三]亿.*鼠标|lol|LOL|马化|德玛西亚|马来西亚之力|[丑帅][哭爆炸掉]|发来\S{2,}|[贺核]电|放开.*我[来上干]|放开[这那哪我]|不要.*(搜|查|百度)|\u4e24\u5973\u4e00\u676f|\|破[鞋处處]|[处處][女男]|[绿綠]茶|[马玛瑪]丽苏|婊|脸不.{0,1}给.{0,1}看|[当档挡].*脸|是你们.{0,2}看|你在[哪那]里|[别憋鳖][跑走]|等我|[我你].*(宇宙|世界).*[丑笨帅傻酷]|大声.*(告诉|说出)|张杰|郭德[纲肛]|汪[峰涵]|头条|^@.{1,9}$|若风|老E|老e|纯黑|bishi|鼻屎|碧诗|姥爷|aoao|由我(来){0,}([守保]护|捍卫|改[写变])|[此今]生|来[世生]|((我){0,}就|我(就){0,}).{0,3}来了|^来了$|见(.)|([被由]我|偷偷|悄悄|被)(来){0,}承包|休想|承包.{0,5}|裤子.*脱|脱.*裤子|丢[你泥尼拟雷累类妮呢伱妮][老楼漏][母某]|扑街|周.活|(喵|嘿|哈){2,}|(萝莉){2,}|([^？！\?\!]+)\1{2,}|[\!\?！？]{4,}|熟[练悉]|\.\w{2,3}|(b|B)数|/[+加][1一]/|/学[完到了]/|/[老劳捞佬姥][自字子紫资仔兹姿滋]/|再[来看]一[遍次]|[一二三四五六七八九十][遍次]|R[Ee][Cc]$'

#防止脚本出错的预留值，无意义
source_url="BV1As411i7rr"

trap "onCtrlC" INT
function onCtrlC () {
    echo -e "\\n结束运行（CTRL-C）"
    exit
}

get_danmaku () {
	target=$(echo "$source_url" | grep -P -o "BV[0-9A-Za-z]{5,15}")
	data=$( curl -s "https://api.bilibili.com/x/web-interface/view?bvid=$target" | sed "s/:/\\n/g;s/,/\\n/g" ) 
	echo $data > tmp.txt
	#cidData=$( curl -s "https://api.bilibili.com/x/player/pagelist?bvid=$target" | sed "s/:/\\n/g;s/,/\\n/g" ) 
	cid=$( echo "$data" | grep -E -A1 "\"cid\"" | grep -E "[0-9]+" | head -1)
	#titleData=$( curl -s "https://api.bilibili.com/x/web-interface/view?cid=$cid&bvid=$target" | sed "s/:/\\n/g;s/,/\\n/g" ) 
	title=$( echo -e "$data" | grep -E -A1 "\"title\"" | grep -Po "([A-Za-z]|[^\\x00-\\xff]|[0-9])+" | sed ":a;N;s/\\n/ /g;ta" )
	curl -s -k -L --compressed -o "${title:6}.xml" "http://comment.bilibili.com/$cid.xml"
	danmaku2ass -f Bilibili -o "${title:6}.ass" -s "$screen_size" -fn "$font" -fs $font_size -a $alpha -dm $duration_marquee -ds $duration_still -fl "$danmaku_filter" "${title:6}.xml"
	rm "${title:6}.xml"
	echo "完成 BV:$target CID:$cid 标题：${title:6}"
}

cd "$danmaku_path" || exit
if [ -z "$1" ]
then
	echo "请输入带有BV号的视频链接，结束请输入n"
	while read -r -p "链接：" urllink
	do
		if [ "$urllink" = "n" ]
		then
			break
		fi
		source_url=$urllink
		get_danmaku
	done
else
	source_url=$1
	get_danmaku
fi
echo "结束运行"
exit
