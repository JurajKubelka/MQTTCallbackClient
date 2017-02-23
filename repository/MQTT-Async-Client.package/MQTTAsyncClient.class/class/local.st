examples
local
	<script: 'self local inspect'>
	<gtExample>
	<label: 'A client conencted to localhost'>
	^ MQTTAsyncClient new
		host: NetNameResolver loopBackName;
		port: 1883;
		clientId: 'IoT Eclipse Async Client';
		open;
		yourself.