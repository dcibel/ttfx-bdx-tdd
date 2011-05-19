package ttfx.bdx.tdd
{
	import flash.events.Event;
	
	import flexunit.framework.Assert;
	
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;
	import mockolate.strict;
	
	import mx.rpc.http.HTTPService;
	
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.hamcrest.object.hasProperties;
	
	public class AddContactCommandTest {
		
		
		[Before(async, timeout=5000)]
		public function prepareMockolates():void {
			Async.proceedOnEvent(this,
				prepare(HTTPService),
				Event.COMPLETE);
		}
		
		[Test(description="Example with assertion")]
		public function testExecute1():void {
			var service:HTTPService = nice(HTTPService);
			
			var command:AddContactCommand = new AddContactCommand(service);
			command.firstName = "Mickey";
			command.lastName = "Mouse";
			
			command.execute();
			
			assertThat(service, received().method('send').arg( hasProperties(
				{firstName: "Mickey", lastName: "Mouse"}) ));
		}
	}
}