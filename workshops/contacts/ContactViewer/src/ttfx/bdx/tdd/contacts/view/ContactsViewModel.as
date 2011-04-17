package ttfx.bdx.tdd.contacts.view {
	import flash.events.EventDispatcher;
	
	import mx.collections.IList;
	
	import ttfx.bdx.tdd.contact.service.ContactService;

	public class ContactsViewModel extends EventDispatcher{
		
		[Bindable]
		public var contacts:IList;
		
		private var service:ContactService;
		
		public function ContactsViewModel(service:ContactService) {
			this.service = service;
		}
		
		public function getContacts():void {
			service.getAllContacts(
				function(contactList:IList):void {
					contacts = contactList;
				}, onError);
		}
		
		private function onError(error:Error):void {
			
		}
	}
}