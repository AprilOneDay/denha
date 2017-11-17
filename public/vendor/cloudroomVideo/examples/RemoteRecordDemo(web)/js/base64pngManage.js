var d305806c = {}
function addBase64png(key,base64pngArr)
{
	d305806c[key] = base64pngArr
}
function getBase64png(key)
{
	return d305806c[key]
}
function delBase64png(key)
{
	delete d305806c["key"]
}