#!/bin/bash

tvIP=192.168.1.2
tvPort=52235

curl -v "http://$tvIP:$tvPort/upnp/control/RenderingControl1" \
	-H 'Content-Type: text/xml; charset="utf-8"' \
	-H 'SOAPACTION: "SoapAction:urn:schemas-upnp-org:service:RenderingControl:1#SetVolume"' \
	-d '
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
<s:Body>
<ns0:SetVolume xmlns:ns0="urn:schemas-upnp-org:service:RenderingControl:1">
<InstanceID>0</InstanceID>
<Channel>Master</Channel>
<InstanceID>0</InstanceID>
<DesiredVolume>69</DesiredVolume>
</ns0:SetVolume>
</s:Body>
</s:Envelope>
'
