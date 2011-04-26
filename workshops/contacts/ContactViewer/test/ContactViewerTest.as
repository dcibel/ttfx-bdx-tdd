package  {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	
	import ttfx.bdx.tdd.contact.service.Contact;
	import ttfx.bdx.tdd.contacts.view.ContactsViewModel;

	public class ContactViewerTest {		
		
		[Test]
		public function testGetAllContactsOnCreationComplete():void {
			var application:ContactViewer = new ContactViewer();
			var recordingViewModel:ContactsViewModelRecording = new ContactsViewModelRecording();
			application.viewModel = recordingViewModel;
			
			application.dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
			
			assertEquals(1, recordingViewModel.callCount("getContacts"));
		}
		
		[Test]
		public function testContactListPanelUsesViewModelList():void {
			var application:ContactViewer = new ContactViewer();
			application.viewModel = new ContactsViewModelStub();
			
			application.viewModel.contacts = new ArrayCollection([
				new Contact(0, "Bruce", "Wayne", "00000"),
				new Contact(1, "John", "McLane", "00000")]);
			
			UIImpersonator.addChild( application );
			
			assertEquals(application.viewModel.contacts.getItemAt(0), application.contactsPanel.contacts.getItemAt(0));
			assertEquals(application.viewModel.contacts.getItemAt(1), application.contactsPanel.contacts.getItemAt(1));
			assertEquals(2, application.contactsPanel.contacts.length);
		}
	}
}
import flash.utils.Dictionary;

import ttfx.bdx.tdd.contacts.view.ContactsViewModel;

class ContactsViewModelRecording extends ContactsViewModel {
	
	private var calls:Dictionary = new Dictionary();
	
	public function ContactsViewModelRecording() {
		super(null);
	};
	
	override public function getContacts():void {
		recordCall("getContacts");
	}
	
	private function recordCall(functionName:String, ...args):void {
		if ( !calls[functionName] ) {
			calls[functionName] = new Array();
		}
		calls[functionName].push(args);
	}
	
	public function callCount(functionName:String):int {
		if ( !calls[functionName] ) {
			return 0;
		} else {
			return calls[functionName].length;
		}
	}
}

class ContactsViewModelStub extends ContactsViewModel {
	
	public function ContactsViewModelStub() {
		super(null);
	};
	
	override public function getContacts():void {
	}
}