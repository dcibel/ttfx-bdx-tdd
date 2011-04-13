package ttfx.bdx.tdd.contact.service {
	import flash.events.IEventDispatcher;

	public interface ContactService extends IEventDispatcher {
		function getAllContacts(resultHandler:Function, faultHandler:Function):void;
		
		function addContact(firstName:String, lastName:String, phone:String,
							resultHandler:Function, faultHandler:Function):void;
		
		function updateContactContact(id:int, firstName:String, lastName:String, phone:String,
									  resultHandler:Function, faultHandler:Function):void;
		
		function deleteContactContact(id:int,
									  resultHandler:Function, faultHandler:Function):void;
	}
}