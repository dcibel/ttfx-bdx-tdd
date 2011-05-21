package ttfx.bdx.tdd
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class AddContactCommand extends EventDispatcher {
		
		private var service:HTTPService;
		
		public var firstName:String;
		public var lastName:String;
		
		public function AddContactCommand(service:HTTPService) {
			super();
			this.service = service;
		}
		
		public function execute():void {
			service.send({firstName:firstName, lastName:lastName});
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		private function onResult(event:ResultEvent):void {
			if (event.result == "ttfx.bdx.tdd.server.AddressBookIsFullError") {
				dispatchEvent(new CommandErrorEvent("error"));
			}
		}
	}
}