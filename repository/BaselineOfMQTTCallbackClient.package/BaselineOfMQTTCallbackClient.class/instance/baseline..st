baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			project: 'MQTT' with: [
				spec
					className: #ConfigurationOfMQTT;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/MQTT/main/' ];
			package: #'MQTT-Async-Client' with: [
				spec requires: #( 'MQTT' ). ];
			group: 'default' with: #(client)
	].