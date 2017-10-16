// JavaScript Document
var subClassList = [
	{'2':{'':'-请选择-','市政建设':'市政建设','抢险':'抢险','项目开发':'项目开发'}},
	{'1':{'':'-请选择-','机械加工类':'机械加工类','食品（饮料）制造类':'食品（饮料）制造类','金属冶炼及压延加工类':'金属冶炼及压延加工类','纺织类':'纺织类','木材加工及木、竹、藤、棕、草制品类':'木材加工及木、竹、藤、棕、草制品类','计算机及其他电子设备制造类':'计算机及其他电子设备制造类','水泥制品类':'水泥制品类'}},
	{'3':{'':'-请选择-','娱乐行业':'娱乐行业','居民服务业':'居民服务业','餐饮业':'餐饮业'}},
	{'4':{'':'-请选择-','其他':'其他','其他':'其他'}}
];

function changeSubClass(province, subClassid) {
    var subClassMap;
    for (i = 0; i < subClassList.length; i++) {
        var classMap = subClassList[i];
        for (var prop in classMap) {
            if (prop == province) {
                subClassMap = classMap[prop];
            }
        }
    }
    setSelectOption(subClassid, subClassMap, '');
}