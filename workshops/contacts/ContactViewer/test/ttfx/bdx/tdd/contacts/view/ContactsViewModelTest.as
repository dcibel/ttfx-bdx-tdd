package ttfx.bdx.tdd.contacts.view {
	import mx.collections.ArrayCollection;
	
	import org.flexunit.asserts.assertEquals;
	
	import ttfx.bdx.tdd.contact.service.Contact;
	
	public class ContactsViewModelTest {
		
		[Test]
		public function testGetContacts():void {
			var contact:Contact 
			var service:GetContactsMock = new GetContactsMock();
			service.contacts = new ArrayCollection([
				new Contact(0, "Bruce", "Wayne", "00000"),
				new Contact(1, "John", "McLane", "00000")]);
			var viewModel:ContactsViewModel = new ContactsViewModel(service);
			
			viewModel.getContacts();
			
			assertEquals(service.contacts.getItemAt(0), viewModel.contacts.getItemAt(0));
			assertEquals(service.contacts.getItemAt(1), viewModel.contacts.getItemAt(1));
			assertEquals(2, viewModel.contacts.length);
		}
		
		[Test]
		public function testGetContactsWithError():void {
			
		}
		
	}
}
import flash.events.EventDispatcher;

import mx.collections.IList;

import ttfx.bdx.tdd.contact.service.ContactService;

class GetContactsMock extends EventDispatcher implements ContactService {
	public var contacts:IList;
	public var error:Error;
	
	public function getAllContacts(resultHandler:Function, faultHandler:Function):void {
		if (error) {
			faultHandler(error);
		} else {
			resultHandler(contacts);
		} 
	}
	
	public function addContact(firstName:String, lastName:String, phone:String,
						resultHandler:Function, faultHandler:Function):void {}
	
	public function updateContactContact(id:int, firstName:String, lastName:String, phone:String,
								  resultHandler:Function, faultHandler:Function):void {}
	
	public function deleteContactContact(id:int,
								  resultHandler:Function, faultHandler:Function):void {}
}