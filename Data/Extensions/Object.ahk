#Requires AutoHotkey v2.0

Object.Prototype.Get := (this, key, default := '') {
	return (this.HasOwnProp(key)) ? this.GetOwnPropDesc(key).Value : default
}