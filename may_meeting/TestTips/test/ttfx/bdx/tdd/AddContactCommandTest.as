package ttfx.bdx.tdd
{
	import flash.events.Event;
	
	import flexunit.framework.Assert;
	
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;
	import mockolate.strict;
	import mockolate.stub;
	import mockolate.verify;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import net.digitalprimates.fluint.async.AsyncHandler;
	
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.hamcrest.core.isA;
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
		
		[Test(description="Example with strict mock")]
		public function testExecute2():void {
			var service:HTTPService = strict(HTTPService);
			
			stub(service).method("addEventListener").anyArgs().once();
			stub(service).method("send").args( 
				hasProperties( {firstName: "Mickey", lastName: "Mouse"} ) ).once();
			
			var command:AddContactCommand = new AddContactCommand(service);
			command.firstName = "Mickey";
			command.lastName = "Mouse";
			
			command.execute();
			
			verify(service); // make sure the mock method was called
		}
		
		[Test(async)]
		public function testDispatchesErrorEventWhenResultIsErrorCode():void {
			var service:HTTPService = strict(HTTPService);
			stub(service).method("send").anyArgs().once().dispatches(
				ResultEvent.createEvent("ttfx.bdx.tdd.server.AddressBookIsFullError"), 300);
			
			var command:AddContactCommand = new AddContactCommand(service);
			command.execute();
			
			Async.handleEvent(this, command, CommandErrorEvent.ERROR,
				function(event:Event, passThroughData:Object):void {
					assertThat(event, isA(CommandErrorEvent));
				});
		}		
	}
}