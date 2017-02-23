examples
iotEclipse
	<script: 'self iotEclipse inspect'>
	<gtExample>
	<label: 'A client conencted to iot.eclipse.org'>
	^ MQTTAsyncClient new
		host: 'iot.eclipse.org';
		port: 1883;
		clientId: 'IoT Eclipse Async Client';
		open;
		yourself.