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
			package: #'MQTT-CallbackClient' with: [
				spec requires: #( #'MQTT' ). ];
			package: #'MQTT-CallbackClientTests' with: [
				spec requires: #( #'MQTT-CallbackClient' ). ];
			group: 'tests' with: #( #'MQTT-CallbackClientTests' );
			group: 'client' with: #( #'MQTT-CallbackClient' );
			group: 'default' with: #( client tests )
	].