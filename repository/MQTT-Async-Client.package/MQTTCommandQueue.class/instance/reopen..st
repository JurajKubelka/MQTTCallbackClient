accessing
reopen: aMQTTCommand 
	"(Re-)Open connection with a server/broker.
	The command is called before other commands, e.g., ping,
	if the connection with the server/broker is lost."
	reopen := aMQTTCommand.